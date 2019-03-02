//
//  AAViewController.h
//  LYRuntime
//
//  Created by l y on 17/1/11.
//  Copyright © 2017年 abc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@protocol RunDelegate <NSObject>

-(void)runprotocol;

@end

@interface AAViewController : UIViewController

-(void)runmethod;
+(void)runmethodclass;
+ (BOOL)resolveAdd:(SEL)sel;
@property (nonatomic,copy)NSString *runproperty;


@property(nonatomic,weak)id<RunDelegate> ttdelegate;

@end
