//
//  Tool.h
//  驾照助手
//
//  Created by 袁杰 on 16/10/21.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Tool : NSObject
+(NSArray *)getAnswerWithString:(NSString *)str;
+(CGSize)getSizeWithString:(NSString *)str with:(UIFont *)font withSize:(CGSize)size;
@end
