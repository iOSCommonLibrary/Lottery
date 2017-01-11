//
//  DataBaseOperation.h
//  HeXin
//
//  Created by zzy on 10/8/15.
//  Copyright © 2015 zzy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataBaseOperation : NSObject

+ (FMDatabase *)createSql;

//操作数据库
+ (BOOL)Operation:(NSString *)sqlStr;

//查询
+ (FMResultSet *)getQuery:(NSString *)sqlStr;

+ (void)DeleteSqlite;

@end
