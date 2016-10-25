//
//  textViewController.h
//  驾照助手
//
//  Created by 袁杰 on 16/10/21.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface textViewController : UIViewController
@property(nonatomic,copy)NSString *myTitle;
@property(nonatomic,copy)NSArray *dataArray;
@property(nonatomic,assign)int type;//1.章节，2.专项
@end
