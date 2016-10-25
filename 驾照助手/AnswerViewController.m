//
//  AnswerViewController.m
//  驾照助手
//
//  Created by 袁杰 on 16/10/21.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import "AnswerViewController.h"
#import "AnswerScrollView.h"
#import "MyDataManager.h"
#import "AnswerModel.h"
#import "SelectModelView.h"
#import "SheetView.h"
#import "QuestionCollectManager.h"
@interface AnswerViewController ()<UIAlertViewDelegate,SheetViewDelegate>{
    AnswerScrollView *_answerScrollView;
    SelectModelView *modelView;
    SheetView *_sheetView;
    NSTimer *_timer;
    UILabel *_timeLabel;
}
@end

@implementation AnswerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout=UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self creatData];
    
    [self.view addSubview:_answerScrollView];
    [self creatModelView];
    [self creatSheetView];
    [self creatToolBar];
}
-(void)creatData{
    if (_type==1) {
        NSArray *array = [MyDataManager getData:answer];
        NSMutableArray *arr = [[NSMutableArray alloc]init];
        for (int i=0; i<array.count-1; i++) {
            AnswerModel *model=array[i];
            if ([model.pid intValue]==_number+1) {
                [arr addObject:model];
            }
        }
        _answerScrollView = [[AnswerScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-64) withDataArray:arr ];
    }else if (_type==2)//随机练习
    {
        _answerScrollView = [[AnswerScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-64) withDataArray:[MyDataManager getData:answer] ];
    }else if(_type==3)//专项练习
    {
        NSArray *array = [MyDataManager getData:answer];
        NSMutableArray *temArr = [[NSMutableArray alloc]init];
        NSMutableArray *dataArray = [[NSMutableArray alloc]init];
        [temArr addObjectsFromArray:array];
        for (int i=0; i<temArr.count; ) {
            int index = arc4random()%(temArr.count);
            [dataArray addObject:temArr[index]];
            [temArr removeObjectAtIndex:index];
        }
        _answerScrollView = [[AnswerScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-64) withDataArray:dataArray ];
    }else if (_type==4){
        NSArray *array = [MyDataManager getData:answer];
        NSMutableArray *arr = [[NSMutableArray alloc]init];
        for (int i=0; i<array.count-1; i++) {
            AnswerModel *model=array[i];
            if ([model.sid isEqualToString:_subStrNumber]) {
                [arr addObject:model];
            }
        }
        _answerScrollView = [[AnswerScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-64) withDataArray:arr ];
    }else if (_type==5)
    {
        NSArray *array = [MyDataManager getData:answer];
        NSMutableArray *temArr = [[NSMutableArray alloc]init];
        NSMutableArray *dataArray = [[NSMutableArray alloc]init];
        [temArr addObjectsFromArray:array];
        for (int i=0; i<100;i++ ) {
            int index = arc4random()%(temArr.count);
            [dataArray addObject:temArr[index]];
            [temArr removeObjectAtIndex:index];
    }
        _answerScrollView = [[AnswerScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-64) withDataArray:dataArray ];
        [self creatNavBtn];
    }
    if (_type==7) {
        //读取错题
        NSArray *array = [MyDataManager getData:answer];
        NSMutableArray *arr = [[NSMutableArray alloc]init];
        NSArray *wrongArray = [QuestionCollectManager getWrongQuestion];
        for (AnswerModel *model in array) {
            for (NSString *num in wrongArray) {
                if ([num isEqualToString:model.mid]) {
                    [arr addObject:model];
                }
            }
        }
    }
    if (_type==8) {
        //读取收藏
        NSArray *array = [MyDataManager getData:answer];
        NSMutableArray *arr = [[NSMutableArray alloc]init];
        NSArray *wrongArray = [QuestionCollectManager getCollectQuestion];
        for (AnswerModel *model in array) {
            for (NSString *num in wrongArray) {
                if ([num isEqualToString:model.mid]) {
                    [arr addObject:model];
                }
            }
        }
    }
    if (_type!=5&&_type!=6) {
         [self creatToolBar];
    }else {
        [self creatTestToolBar];
        _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(runTime) userInfo:nil repeats:YES];
        _timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 64)];
        _timeLabel.text = @"60:00";
        _timeLabel.textAlignment=NSTextAlignmentCenter;
        self.navigationItem.titleView=_timeLabel;
    }
    
}
-(void)runTime{
    static int Time = 3600;
    Time--;
    _timeLabel.text=[NSString stringWithFormat:@"%d:%d",Time/60,Time%60];
}
-(void)creatTestToolBar{
    UIView *barView= [[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-60-64, self.view.frame.size.width, 60)];
    barView.backgroundColor = [UIColor whiteColor];
    NSArray *arr = @[[NSString stringWithFormat:@"%ld",_answerScrollView.dataArray.count],@"收藏本题"];
    for (int i=0; i<2; i++) {
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame=CGRectMake(self.view.frame.size.width/2*i+self.view.frame.size.width/2/2-22, 10, 30, 30);
        [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png",16+i]] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d-2.png",16+i]] forState:UIControlStateHighlighted];
        btn.tag = 301+i;
        [btn addTarget:self action:@selector(clickToolBar:) forControlEvents:UIControlEventTouchUpInside];
        UILabel *label =[[UILabel alloc]initWithFrame:CGRectMake(btn.center.x-25, 40, 50, 18)];
        label.textAlignment=NSTextAlignmentCenter;
        label.text=arr[i];
        label.font=[UIFont systemFontOfSize:10];
        [barView addSubview:btn];
        [barView addSubview:label];
    }
    [self.view addSubview:barView];
}
-(void)creatNavBtn{
    UIBarButtonItem *itemLeft=[[UIBarButtonItem alloc]init];
    itemLeft.title = @"返回";
    [itemLeft setTarget:self];
    [itemLeft setAction:@selector(clickNavBtnReturn)];
    self.navigationItem.leftBarButtonItem=itemLeft;
    
    UIBarButtonItem *itemRight=[[UIBarButtonItem alloc]init];
    itemRight.title=@"交卷";
    [itemRight setTarget:self];
    [itemRight setAction:@selector(clickRightItem)];
    self.navigationItem.rightBarButtonItem=itemRight;
    
}
-(void)clickRightItem{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"时间还多，确定要离开考试吗？" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"不，谢谢" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"我要交卷" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //交卷处理
        int score=0;
        NSArray *myAnswerArray = _answerScrollView.hadAnswerArray;
        NSArray *answerArray = _answerScrollView.dataArray;
        for (int i=0; i<myAnswerArray.count; i++) {
            //答题类型判断
            AnswerModel *model = answerArray[i];
            NSString *answerStr = model.manswer;
            NSString *myAnswerStr = [NSString stringWithFormat:@"%c",'A'-1+[myAnswerArray[i] intValue]];
            if ([answerStr isEqualToString:myAnswerStr]) {
                score++;
            }
        }
        [self.navigationController popViewControllerAnimated:YES];
    }];
    [alert addAction:cancelAction];
    [alert addAction:sureAction];
    [self presentViewController:alert animated:YES completion:nil];
}
-(void)clickNavBtnReturn{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"时间还多，确定要离开考试吗？" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"不，谢谢" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"我要离开" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
    [alert addAction:cancelAction];
    [alert addAction:sureAction];
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)creatSheetView{
    _sheetView = [[SheetView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height-80)withSuperView:self.view andQuestionCount:(int)_answerScrollView.dataArray.count];
    [self.view addSubview:_sheetView];
}
-(void)creatToolBar{
    UIView *barView= [[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-60-64, self.view.frame.size.width, 60)];
    barView.backgroundColor = [UIColor whiteColor];
    NSArray *arr = @[[NSString stringWithFormat:@"%ld",_answerScrollView.dataArray.count],@"查看答案 ",@"收藏本题"];
    for (int i=0; i<3; i++) {
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame=CGRectMake(self.view.frame.size.width/3*i+self.view.frame.size.width/3/2-22, 10, 30, 30);
        [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png",16+i]] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d-2.png",16+i]] forState:UIControlStateHighlighted];
        btn.tag = 301+i;
        [btn addTarget:self action:@selector(clickToolBar:) forControlEvents:UIControlEventTouchUpInside];
        UILabel *label =[[UILabel alloc]initWithFrame:CGRectMake(btn.center.x-25, 40, 50, 18)];
        label.textAlignment=NSTextAlignmentCenter;
        label.text=arr[i];
        label.font=[UIFont systemFontOfSize:10];
        [barView addSubview:btn];
        [barView addSubview:label];
    }
    [self.view addSubview:barView];
}
#pragma mark - delegate
-(void)SheetViewClick:(int)index{
    UIScrollView *scroll = _answerScrollView->_scrollView;
    scroll.contentOffset=CGPointMake((index-1)*scroll.frame.size.width, 0);
    [scroll.delegate scrollViewDidEndDecelerating:scroll];
}
-(void)creatModelView{
    modelView = [[SelectModelView alloc]initWithFrame:self.view.frame addTouch:^(SelectModel model) {
        NSLog(@"当前模式:%d",model);
    }];
    [self.view addSubview:modelView];
    modelView.alpha=0;
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:@"答题模式" style:UIBarButtonItemStylePlain target:self action:@selector(modelChange:)];
    self.navigationItem.rightBarButtonItem=item;
}
-(void)modelChange:(UIBarButtonItem *)item {
    [UIView animateWithDuration:0.3 animations:^{
        modelView.alpha=1;
    }];
}
-(void)clickToolBar:(UIButton *)btn{
    switch (btn.tag) {
        case 301:{
            [UIView animateWithDuration:0.3 animations:^{
                _sheetView.frame=CGRectMake(0, 80, self.view.frame.size.width, self.view.frame.size.height-80);
                _sheetView->_backView.alpha=0.8;
            }];
        }break;
        case 302:{
            if (_type!=5&&_type!=6) {
                if ([_answerScrollView.hadAnswerArray[_answerScrollView.currentPage]intValue]!=0) {
                    return;
                }else{
                    AnswerModel *model = [_answerScrollView.dataArray objectAtIndex:_answerScrollView.currentPage];
                    NSString *answer = model.manswer;
                    char an = [answer characterAtIndex:0];
                    [_answerScrollView.hadAnswerArray replaceObjectAtIndex:_answerScrollView.currentPage withObject:[NSString stringWithFormat:@"%d",an-'A'+1]];
                }
            }
            
        }
            break;
            case 303://收藏题目
        {
            AnswerModel *model = _answerScrollView.dataArray[_answerScrollView.currentPage];
            [QuestionCollectManager addCollectQuesion:[model.mid intValue]];
            
        }
        default:
            break;
    }
}
@end
