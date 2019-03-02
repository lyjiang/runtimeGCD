//
//  Person+Ch.m
//  LYRuntime
//
//  Created by admin on 17/3/30.
//  Copyright © 2017年 abc. All rights reserved.
//

#import "Person+Ch.h"
#import <objc/runtime.h>
@implementation Person (Ch)
+ (void)load{
    unsigned int count;
    //获取方法列表
    Method *methodList = class_copyMethodList([Person class], &count);
    for (unsigned int i=0; i<count; i++) {
        Method method = methodList[i];
        NSLog(@"method---->%@", NSStringFromSelector(method_getName(method)));
    }
    
    Method otherMethod = class_getClassMethod([Person class], @selector(changeWith));
    Method method = class_getClassMethod([Person class], @selector(mrthod1));
    method_exchangeImplementations(otherMethod, method);
}

+ (void)changeWith{
    NSLog(@"执行方法二");
}



@end
