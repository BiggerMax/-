//
//  MainTestViewController.m
//  驾照助手
//
//  Created by 袁杰 on 16/10/24.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import "MainTestViewController.h"
#import "AnswerViewController.h"
@interface MainTestViewController ()
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;

@end

@implementation MainTestViewController
- (IBAction)clickButton:(UIButton *)sender {
    switch (sender.tag) {
        case 201:
        {
            AnswerViewController *con = [[AnswerViewController alloc]init];
            con.type=5;
            [self.navigationController pushViewController:con animated:YES];
        }
            break;
            
        default:
            break;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"模拟仿真练习";
    _button1.layer.masksToBounds=YES;
    _button1.layer.cornerRadius=8;
    _button2.layer.masksToBounds=YES;
    _button2.layer.cornerRadius=8;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
