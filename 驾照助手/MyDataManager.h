//
//  MyDataManager.h
//  驾照助手
//
//  Created by 袁杰 on 16/10/21.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum {
    chapter,//章节练习
    answer,//答题
    subChapter//专项练习
}DataType;
@interface MyDataManager : NSObject
+(NSArray *)getData:(DataType)type;
@end
