//
//  FirstViewController.m
//  驾照助手
//
//  Created by 袁杰 on 16/10/20.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import "FirstViewController.h"
#import "FirstTableViewCell.h"
#import "textViewController.h"
#import "MyDataManager.h"
#import "AnswerViewController.h"
#import "MainTestViewController.h"
@interface FirstViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *_tableVIew;

@end

@implementation FirstViewController
{
    NSArray *_arrData;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"理论考试";
    UITableView *tableView = [[UITableView alloc]init];
    tableView = self._tableVIew;
    tableView.dataSource =self;
    tableView.delegate = self;
    self.view.backgroundColor = [UIColor whiteColor];
    _arrData = @[@"章节练习",@"顺序练习",@"随机练习",@"专项练习",@"仿真模拟考试"];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return  1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  _arrData.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"FirstTableViewCell";
    FirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:cellID owner:self options:nil]lastObject];
       
    }
    cell.firstIcon.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.png",indexPath.row+7]];
    cell.firstLabel.text = _arrData[indexPath.row];
    return  cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        {
            textViewController *con = [[textViewController alloc]init];
            con.dataArray=[MyDataManager getData:chapter];
            con.myTitle = @"章节练习";
            UIBarButtonItem *item = [[UIBarButtonItem alloc]init];
            item.title = @"";
            con.type=1;
            self.navigationItem.backBarButtonItem = item;
            [self.navigationController pushViewController:con animated:YES];
        }
            break;
        case 1://顺序练习
        {
            AnswerViewController *answer = [[AnswerViewController alloc]init];
            answer.type =2 ;
            [self.navigationController pushViewController:answer animated:YES];
            
        }break;
        case 2:{
            AnswerViewController *answer = [[AnswerViewController alloc]init];
            answer.type =3 ;
            [self.navigationController pushViewController:answer animated:YES];
            
        }break;
            case 3:
        {
            textViewController *con = [[textViewController alloc]init];
            con.dataArray=[MyDataManager getData:subChapter];
            con.myTitle = @"专项练习";
            UIBarButtonItem *item = [[UIBarButtonItem alloc]init];
            item.title = @"";
            con.type=2;
            self.navigationItem.backBarButtonItem = item;
            [self.navigationController pushViewController:con animated:YES];
        }break;
            case 4:
        {
            MainTestViewController *con = [[MainTestViewController alloc]init];
            UIBarButtonItem *item = [[UIBarButtonItem alloc]init];
            item.title = @"";
            self.navigationItem.backBarButtonItem = item;
            [self.navigationController pushViewController:con animated:YES];
        }
        default:
            break;
    }
}
- (IBAction)clickToolsBtn:(UIButton *)sender {
    switch (sender.tag) {
        case 201:
        {
            AnswerViewController *answer = [[AnswerViewController alloc]init];
            answer.type =7 ;
            [self.navigationController pushViewController:answer animated:YES];
        }
            break;
        case 202:
        {
            AnswerViewController *answer = [[AnswerViewController alloc]init];
            answer.type =8 ;
            [self.navigationController pushViewController:answer animated:YES];
        }
            break;
            
        default:
            break;
    }
}

@end
