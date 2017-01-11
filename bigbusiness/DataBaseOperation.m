//
//  DataBaseOperation.m
//  HeXin
//
//  Created by zzy on 10/8/15.
//  Copyright © 2015 zzy. All rights reserved.
//

#import "DataBaseOperation.h"

@implementation DataBaseOperation
static FMDatabase *db;

+ (FMDatabase *)createSql {

    //连接数据库
    NSLog(@"%@",dbPath);
    
    db = [FMDatabase databaseWithPath:dbPath];
    
    if ([db open]) {
        
        NSString *sql = @"create table IF NOT EXISTS tb_collect(job_id primary key);";
        
        //创表
        [db executeUpdate:sql];
    }
    
    return db;

}

//操作数据库
+ (BOOL)Operation:(NSString *)sqlStr  {
   
    return [db executeUpdate:sqlStr];
}


//查询 返回结果集
+ (FMResultSet *)getQuery:(NSString *)sqlStr {
    
    FMResultSet *s = [db executeQuery:sqlStr];
    
    return s;
}

//移除sqlite
+ (void)DeleteSqlite {

    NSFileManager* fileManager=[NSFileManager defaultManager];
    [fileManager removeItemAtPath:dbPath error:nil];
}

@end
