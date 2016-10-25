//
//  ViewController.m
//  驾照助手
//
//  Created by 袁杰 on 16/10/19.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import "ViewController.h"
#import "SelectView.h"
#import "FirstViewController.h"
#import "subjectTwoViewController.h"
#import "WebViewController.h"
@interface ViewController ()
{
    SelectView *_selectView;
    __weak IBOutlet UIButton *selBtn;
}
@end

@implementation ViewController
- (IBAction)selectBtn:(UIButton *)sender{
    switch (sender.tag) {
        case 100:
        {
            [UIView animateWithDuration:0.3 animations:^{
                _selectView.alpha = 1;
            }];
        }
            break;
        case 101:
        {
            UIBarButtonItem *item = [[UIBarButtonItem alloc]init];
            item.title=@"";
            self.navigationItem.backBarButtonItem=item;
            [self.navigationController pushViewController:[[FirstViewController alloc]init] animated:YES];
            
        }
            break;
        case 102:
        {
            UIBarButtonItem *item = [[UIBarButtonItem alloc]init];
            item.title=@"";
            self.navigationItem.backBarButtonItem=item;
            [self.navigationController pushViewController:[[subjectTwoViewController alloc]init] animated:YES];
        }
            break;
        case 103:
        {
        }
            break;
        case 104:
        {
        }
            break;
        case 105:
        {
            UIBarButtonItem *item = [[UIBarButtonItem alloc]init];
            item.title=@"";
            self.navigationItem.backBarButtonItem=item;
            [self.navigationController pushViewController:[[WebViewController alloc]initWithUrl:@"https://baidu.com"] animated:YES];
        }
            break;
        case 106:
        {
            UIBarButtonItem *item = [[UIBarButtonItem alloc]init];
            item.title=@"";
            self.navigationItem.backBarButtonItem=item;
            [self.navigationController pushViewController:[[WebViewController alloc]initWithUrl:@"https://baidu.com"] animated:YES];
        }
            break;
        default:
            break;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _selectView = [[SelectView alloc]initWithFrame:self.view.frame andBtn:selBtn];
    _selectView.alpha = 0;
    [self.view addSubview:_selectView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
