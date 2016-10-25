//
//  QuestionCollectManager.m
//  驾照助手
//
//  Created by 袁杰 on 16/10/24.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import "QuestionCollectManager.h"

@implementation QuestionCollectManager
+(NSArray *)getWrongQuestion{
    NSArray *array = [[NSUserDefaults standardUserDefaults] objectForKey:@"WRONG_QUESTION"];
    if (array!=nil ) {
        return  array;
    }else{
        return @[];
    }
}
+(void)addWrongQuesion:(int)mid{
    NSArray *array = [[NSUserDefaults standardUserDefaults]objectForKey:@"WRONG_QUESTION"];
    NSMutableArray *muArr = [NSMutableArray arrayWithArray:array];
    [muArr addObject:[NSString stringWithFormat:@"%d",mid]];
    [[NSUserDefaults standardUserDefaults]setObject:muArr forKey:@"WRONG_QUESTION"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+(void)removeWrongQuestion:(int)mid{
    NSArray *array = [[NSUserDefaults standardUserDefaults]objectForKey:@"WRONG_QUESTION"];
    NSMutableArray *muArr = [NSMutableArray arrayWithArray:array];
    for (int i=(int)muArr.count-1; i>=0; i--) {
        if ([muArr[i] intValue]==mid) {
            [muArr removeObjectAtIndex:i];
        }
    }
}
+(NSArray *)getCollectQuestion{
    NSArray *array = [[NSUserDefaults standardUserDefaults] objectForKey:@"COLLECT_QUESTION"];
    if (array!=nil ) {
        return  array;
    }else{
        return @[];
    }
}
+(void)addCollectQuesion:(int)mid{
    NSArray *array = [[NSUserDefaults standardUserDefaults]objectForKey:@"COLLECT_QUESTION"];
    NSMutableArray *muArr = [NSMutableArray arrayWithArray:array];
    [muArr addObject:[NSString stringWithFormat:@"%d",mid]];
    [[NSUserDefaults standardUserDefaults]setObject:muArr forKey:@"COLLECT_QUESTION"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+(void)removeCollectQuestion:(int)mid{
    NSArray *array = [[NSUserDefaults standardUserDefaults]objectForKey:@"COLLECT_QUESTION"];
    NSMutableArray *muArr = [NSMutableArray arrayWithArray:array];
    for (int i=(int)muArr.count-1; i>=0; i--) {
        if ([muArr[i] intValue]==mid) {
            [muArr removeObjectAtIndex:i];
        }
    }
}
+(int)getMyScore{
    int score = (int)[[NSUserDefaults standardUserDefaults]integerForKey:@"MY_SCORE"];
    return score;
}
+(void)setMyScore:(int)score{
    [[NSUserDefaults standardUserDefaults]setInteger:score forKey:@"MY_SCORE"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
@end
