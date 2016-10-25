//
//  subjectTwoViewController.m
//  驾照助手
//
//  Created by 袁杰 on 16/10/24.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import "subjectTwoViewController.h"
#import "SubjectTwoTableViewCell.h"
#import <MediaPlayer/MediaPlayer.h>
@interface subjectTwoViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
}

@end

@implementation subjectTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    [self.view addSubview:_tableView];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID =@"SubjectTwoTableViewCell";
    SubjectTwoTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell==nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:cellID owner:self options:nil]lastObject];
    }
    cell.titleImageView.image=[UIImage imageNamed:@""];
    cell.titleLabel.text = [NSString stringWithFormat:@"视频:%ld",indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"" ofType:@"mp4"];
    NSURL *url = [NSURL fileURLWithPath:path];
    MPMoviePlayerViewController *movie = [[MPMoviePlayerViewController alloc]initWithContentURL:url];
    movie.moviePlayer.shouldAutoplay=YES;
    [self.navigationController pushViewController:movie animated:YES];
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
