//
//  AAViewController.m
//  LYRuntime
//
//  Created by l y on 17/1/11.
//  Copyright © 2017年 abc. All rights reserved.
//

#import "AAViewController.h"
@interface AAViewController (){

    NSString *chenyuan;
}

@end

@implementation AAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
}

-(void)runmethod{
}
+(void)runmethodclass{
}

-(void)viewDidLayoutSubviews{

}

void runAddMethod(id self, SEL _cmd, NSString *string){
    NSLog(@"add C IMP %@", string);
}

+ (BOOL)resolveAdd:(SEL)sel{
    NSLog(@"添加方法");
    //给本类动态添加一个方法
//    if ([NSStringFromSelector(sel) isEqualToString:@"resolveAdd:"]) {
        class_addMethod(self, sel, (IMP)runAddMethod, "v@:*");
//    }
    return YES;
}

@end
