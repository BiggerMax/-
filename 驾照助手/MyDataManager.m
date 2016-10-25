//
//  MyDataManager.m
//  驾照助手
//
//  Created by 袁杰 on 16/10/21.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import "MyDataManager.h"
#import "FMDatabase.h"
#import "AnswerModel.h"
#import "TestSelectModel.h"
#import "subTestSelectModel.h"
@implementation MyDataManager
+(NSArray *)getData:(DataType)type{
    static FMDatabase *dataBase;
    NSMutableArray *array = [[NSMutableArray alloc]init];
    if (dataBase==nil) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"data" ofType:@"sqlite" ];
        dataBase=[[FMDatabase alloc]initWithPath:path];
    }
    if ([dataBase open]) {
        NSLog(@"open success");
    }else{
        return array;
    }
    switch (type) {
        case chapter:{
            NSString *sql = @"select pid,pname,pcount FROM firstlevel";
            FMResultSet *rs = [dataBase executeQuery:sql];
            while ([rs next]) {
                TestSelectModel *model = [[TestSelectModel alloc]init];
                model.pid = [NSString stringWithFormat:@"%d",[rs intForColumn:@"pid"]];
                model.pname = [rs stringForColumn:@"pname"];
                model.pcount = [NSString stringWithFormat:@"%d",[rs intForColumn:@"pcount"]];
                [array addObject:model];
            }
        }break;
        case answer:{
            NSString *sql = @"select mquestion,mdesc,mid,manswer,mimage,pid,pname,sid,sname,mtype FROM leaflevel";
            FMResultSet *rs = [dataBase executeQuery:sql];
            while ([rs next]) {
                AnswerModel *model = [[AnswerModel alloc]init];
                model.mquestion = [NSString stringWithFormat:@"%d",[rs intForColumn:@"mquestion"]];
                model.mdesc = [rs stringForColumn:@"mdesc"];
                model.mid = [NSString stringWithFormat:@"%d",[rs intForColumn:@"mid"]];
                model.manswer = [rs stringForColumn:@"manswer"];
                model.mimage = [rs stringForColumn:@"mimage"];
                model.pid = [NSString stringWithFormat:@"%d",[rs intForColumn:@"pid"]];
                model.pname = [rs stringForColumn:@"pname"];
                model.sid = [NSString stringWithFormat:@"%.2f",[rs doubleForColumn:@"sid"]];
                model.sname = [rs stringForColumn:@"sname"];
                model.mtype = [NSString stringWithFormat:@"%d",[rs intForColumn:@"mtype"]];
                [array addObject:model];
            }
        }break;
        case subChapter:{
            NSString *sql = @"select pid,sname,scount,sid,serial FROM secondlevel";
            FMResultSet *rs = [dataBase executeQuery:sql];
            while ([rs next]) {
                subTestSelectModel *model = [[subTestSelectModel alloc]init];
                model.pid = [NSString stringWithFormat:@"%d",[rs intForColumn:@"pid"]];
                model.sname = [rs stringForColumn:@"sname"];
                model.scount = [NSString stringWithFormat:@"%d",[rs intForColumn:@"scount"]];
                model.serial = [NSString stringWithFormat:@"%d",[rs intForColumn:@"serial"]];
                model.sid = [NSString stringWithFormat:@"%.2f",[rs doubleForColumn:@"sid"]];
                [array addObject:model];
            }
        }break;
                default:
            break;
    }
    
    return  array;
}
@end
