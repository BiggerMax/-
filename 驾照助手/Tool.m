//
//  Tool.m
//  驾照助手
//
//  Created by 袁杰 on 16/10/21.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import "Tool.h"

@implementation Tool
+(NSArray *)getAnswerWithString:(NSString *)str{
    NSMutableArray *array = [[NSMutableArray alloc]init ];
    NSArray *arr = [str componentsSeparatedByString:@"<BR>"];
    [array addObject:arr[0]];
    for (int i = 0; i<4; i++) {
        [array addObject:[arr[i+1] substringFromIndex:2]];
    }
    return  array;
}
+(CGSize)getSizeWithString:(NSString *)str with:(UIFont *)font withSize:(CGSize)size{
    CGSize newSize = [str sizeWithFont:font constrainedToSize:size];
    return newSize;
}

@end
