//
//  ViewController.m
//  LYRuntime
//
//  Created by l y on 17/1/11.
//  Copyright © 2017年 abc. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "AAViewController.h"
#import "LYtabbarViewController.h"
#import "Person.h"
#import "OneViewController.h"
#import "TwoViewController.h"
@interface ViewController ()
@property (nonatomic, strong)OneViewController *onevc;
@property (nonatomic, strong)TwoViewController *twovc;
@end

@implementation ViewController
//- (id)forwardingTargetForSelector:(SEL)aSelector{
//    if (aSelector == @selector(weight)) {
//        Person *person = [Person new];
//        return person;
//    }
//    return [super forwardingTargetForSelector:aSelector];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self maopao];
//    [self gcdDemo4];
//    [self gcdDemo0];
//    [self gcdDemo1];
    

    self.view.backgroundColor = [UIColor whiteColor];

    
    
    [Person mrthod1];
    
    unsigned int count;
    
    //获取属性列表
    objc_property_t *propertyList = class_copyPropertyList([AAViewController class], &count);
    for (unsigned int i=0; i<count; i++) {
        const char *propertyName = property_getName(propertyList[i]);
        NSLog(@"property---->%@", [NSString stringWithUTF8String:propertyName]);
    }
    
    unsigned int methCount = 0;
    //获取方法列表
    Method *methodList = class_copyMethodList([AAViewController class], &methCount);
    for (unsigned int i=0; i<methCount; i++) {
        
        Method method = methodList[i];
        NSLog(@"method111---->%@", NSStringFromSelector(method_getName(method)));
    }
    
    //获取成员变量列表
    Ivar *ivarList = class_copyIvarList([AAViewController class], &count);
    for (unsigned int i=0; i<count; i++) {
        Ivar myIvar = ivarList[i];
        const char *ivarName = ivar_getName(myIvar);
        NSLog(@"Ivar---->%@", [NSString stringWithUTF8String:ivarName]);
    }
    
    //获取协议列表
    __unsafe_unretained Protocol **protocolList = class_copyProtocolList([AAViewController class], &count);
    for (unsigned int i=0; i<count; i++) {
        Protocol *myProtocal = protocolList[i];
        const char *protocolName = protocol_getName(myProtocal);
        NSLog(@"protocol---->%@", [NSString stringWithUTF8String:protocolName]);
    }
    
    
    UIButton *btu = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    btu.backgroundColor = [UIColor blueColor];
    btu.alpha = 0.90;
    [btu addTarget:self action:@selector(ff) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btu];
    
//    UIImageView *heheda = [[UIImageView alloc]initWithFrame:CGRectMake(100, 200, 100, 100)];
//    heheda.image = [UIImage imageNamed:@""];
//    [self.view addSubview:heheda];

}

#pragma mark 冒泡排序
- (void)maopao{

    NSMutableArray *array = [[NSMutableArray alloc]initWithObjects:@"1",@"9",@"3",@"4", nil];
    
    for (int i=0; i<array.count; i++) {
        for (int j = i+1; j<array.count; j++) {
            
            if ([array[i] integerValue]>[array[j] integerValue]) {
                NSString *temp = array[i];
                array[i] = array[j];
                array[j] = temp;
            }
        }
    }
    NSLog(@"哈哈哈鲁跟%@",array);
    
}

#pragma mark GCD 
//并行异步队列
- (void)gcdDemo0 {
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_async(group, queue, ^{
        for (int i=0; i<5; i++) {
            NSLog(@"%@---%zd并行异步队列组",[NSThread currentThread],index);
        }
        
    });
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"%@---%zd并行异步队列主",[NSThread currentThread],index);
    });
}

//串行异步队列
- (void)gcdDemo1 {
    for (NSInteger index = 0; index < 4; index ++) {
        // 创建一个串行队列
        dispatch_queue_t queue =  dispatch_queue_create("zy", NULL);
        // 将任务添加到队列中
        dispatch_async(queue, ^{
            NSLog(@"%@---%zd串行异步队列",[NSThread currentThread],index);
        });
    }
}

- (void)gcdDemo4 {
    // 创建串行队列
    // 串行队列的特点：队列中的任务必须按顺序执行。
    // 不管是同步还是异步，串行队列中的任务都是按顺序执行，异步会开线程，开一条。同步不开线程，在当前线程执行任务。
    dispatch_queue_t queue =  dispatch_queue_create("zy", NULL);
    for (NSInteger index = 0; index < 3; index ++) {
        // 将任务添加到队列中
        dispatch_sync(queue, ^{
            NSLog(@"%@---%zd串行同步队列",[NSThread currentThread],index);
        });
    }
}

- (void)gcddemo2{
    dispatch_queue_t queue = dispatch_queue_create("hh", NULL);
    dispatch_async(queue, ^{
        
    });
}

+ (instancetype) IMone{

    static dispatch_once_t once;
    static ViewController *view;
    dispatch_once(&once, ^{
        view = [[ViewController alloc] init];
    });
    return view;
}

-(void)ff{
    LYtabbarViewController *_tabBarController = [LYtabbarViewController new];
    
    [self.navigationController pushViewController:_tabBarController animated:YES];
}
@end
