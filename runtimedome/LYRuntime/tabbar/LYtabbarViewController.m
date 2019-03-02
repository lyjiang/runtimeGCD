//
//  LYtabbarViewController.m
//  LYRuntime
//
//  Created by l y on 17/4/9.
//  Copyright © 2017年 abc. All rights reserved.
//

#import "LYtabbarViewController.h"
#import "OneViewController.h"
#import "TwoViewController.h"
@interface LYtabbarViewController ()
@property (nonatomic, strong)UITabBarController *tabBarController;
@property (nonatomic, strong)OneViewController *onevc;
@property (nonatomic, strong)TwoViewController *twovc;
@end

@implementation LYtabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

    self.onevc = [OneViewController new];
    self.onevc.view.backgroundColor = [UIColor blueColor];
    self.onevc.tabBarItem.title = @"第一个";
    self.onevc.tabBarItem.image = [UIImage imageNamed:@"one"];
    self.onevc.tabBarItem.selectedImage = [UIImage imageNamed:@"oneselected"];
    //    self.onevc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"第一个" image:[UIImage imageNamed:@""] selectedImage:[UIImage imageNamed:@""]];
    [(UITabBarItem *)[self.tabBar.items objectAtIndex:0] setImage:[UIImage imageNamed:@"聊天"]];
    
    self.twovc = [TwoViewController new];
    self.twovc.view.backgroundColor = [UIColor redColor];
    self.twovc.tabBarItem.title = @"第二个";
    self.twovc.tabBarItem.image = [UIImage imageNamed:@"two"];
    self.twovc.tabBarItem.selectedImage = [UIImage imageNamed:@"twoselected"];
    
    UIImage *selectedImage = [UIImage imageNamed:@"one"];
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.onevc.tabBarItem.selectedImage = selectedImage;
    UIEdgeInsets imageInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    self.onevc.tabBarItem.imageInsets = imageInsets;
    
    
    [self addChildViewController:self.onevc];
    
    [self addChildViewController:self.twovc];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
