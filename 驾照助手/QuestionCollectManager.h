//
//  QuestionCollectManager.h
//  驾照助手
//
//  Created by 袁杰 on 16/10/24.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuestionCollectManager : NSObject
//错题记录
+(NSArray *)getWrongQuestion;
+(void)addWrongQuesion:(int)mid;
+(void)removeWrongQuestion:(int)mid;
//收藏
+(NSArray *)getCollectQuestion;
+(void)addCollectQuesion:(int)mid;
+(void)removeCollectQuestion:(int)mid;

+(int)getMyScore;
+(void)setMyScore:(int)score;
@end
