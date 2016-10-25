//
//  SheetView.m
//  驾照助手
//
//  Created by 袁杰 on 16/10/23.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import "SheetView.h"
@interface SheetView(){
    
    UIView *_superView;
    BOOL _startMoving;
    float _hight;
    float _width;
    float _y;
    UIScrollView *_scrollView;
    int _count;
}
@end
@implementation SheetView
- (instancetype)initWithFrame:(CGRect)frame withSuperView:(UIView *)superView andQuestionCount:(int)count
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor= [UIColor whiteColor];
        _hight=frame.size.height;
        _width=frame.size.width;
        _y=frame.origin.y;
        _superView = superView;
        _count=count;
        [self creatView];
    }
    return self;
}
-(void)creatView{
    _backView = [[UIView alloc]initWithFrame:_superView.frame];
    _backView.backgroundColor=[UIColor blackColor];
    _backView.alpha = 0;
    [_superView addSubview:_backView];
    
    _scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 70, self.frame.size.width, self.frame.size.height-70)];
    _scrollView.backgroundColor = [UIColor redColor];
    [self addSubview:_scrollView];
    for (int i=0; i<_count; i++) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        btn.frame=CGRectMake((_width-54*6)/2+54*(i%6), 10+54*(i/6), 50, 50);
        btn.backgroundColor=[UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1];
        if (i==0) {
            btn.backgroundColor = [UIColor orangeColor];
        }
        [btn setTitle:[NSString stringWithFormat:@"%d",i+1] forState:UIControlStateNormal];
        btn.layer.masksToBounds=YES;
        btn.layer.cornerRadius = 10;
        btn.tag = 101+i;
        [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [_scrollView addSubview:btn];
    }
    int tip = (_count%6)?1:0;
    _scrollView.contentSize=CGSizeMake(0, 20+54*(_count/6+1+tip));
}
-(void)click:(UIButton *)btn{
    int index = (int)btn.tag-100;
    for (int i=0; i<_count-1; i++) {
        UIButton *button = [self viewWithTag:101+i];
        if (i!=index-1) {
            button.backgroundColor=[UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1];
        }else{
            button.backgroundColor=[UIColor orangeColor];
        }
    }
    [_delegate SheetViewClick:index];
}
//拖动动画
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:[touch view]];
    if (point.y<25) {
        _startMoving=YES;
    }
    if (_startMoving&&self.frame.origin.y>=_y-_hight&&[self convertPoint:point toView:_superView].y>=80) {
        self.frame=CGRectMake(0, [self convertPoint:point toView:_superView].y, _width, _hight);
        float offset = (_superView.frame.size.height-self.frame.origin.y)/_superView.frame.size.height*0.8;
        _backView.alpha=offset;
    }
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    _startMoving=NO;
    if (self.frame.origin.y>_y-_hight/2) {
        [UIView animateWithDuration:0.3 animations:^{
            self.frame=CGRectMake(0, _y, _width, _hight);
            _backView.alpha=0;
        }];
    }else{
        [UIView animateWithDuration:0.3 animations:^{
            self.frame=CGRectMake(0, _y-_hight, _width, _hight);
        }];
    }
}

@end
