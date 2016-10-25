//
//  AnswerViewController.h
//  驾照助手
//
//  Created by 袁杰 on 16/10/21.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnswerViewController : UIViewController
@property(nonatomic,assign)int number;
@property(nonatomic,assign)int type;//1.章节，2.顺序，3.随机，4.专项,5.模拟考试，6.先未答，7.我的错题，8.我的收藏
@property(nonatomic,copy)NSString *subStrNumber;
@end
