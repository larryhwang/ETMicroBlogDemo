//
//  ETTabBarController.m
//  ETWeibo
//
//  Created by Larry on 15/8/19.
//  Copyright (c) 2015年 Larry. All rights reserved.
//

#import "ETTabBarController.h"
#import "UIImage+ETRemRender.h"
#import "ETTabBar.h"

#import "ETDiscoverController.h"
#import "EThomeController.h"
#import "ETProfileController.h"
#import "ETMessageController.h"

#import "ETNavController.h"

@interface ETTabBarController ()

@end

@implementation ETTabBarController

+(void)initialize {
    
    //获取当前类下的UItabBarItem ,避免把系统的UItabarItem 也更改了
    UITabBarItem *item = [UITabBarItem appearanceWhenContainedIn:self, nil];
    //属性字典
    NSMutableDictionary *att = [NSMutableDictionary dictionary];
    att[NSForegroundColorAttributeName] = [UIColor orangeColor];   //前面是Key，后面是Value
    
    //在初始化的时候就更改属性
    [item setTitleTextAttributes:att forState:UIControlStateSelected];
}

-(void) viewDidLoad {
    [super viewDidLoad];
    [self setUpAllChildViewController];
    
    ETTabBar *etTabBar = [[ETTabBar alloc]initWithFrame:self.tabBar.frame];
    //于此替换系统自带的tabBar
    NSLog(@"%@",self.tabBar);
    [self setValue:etTabBar forKey:@"tabBar"];   //通过KVC键值来替换,干掉readOnly，暗渡陈仓
    NSLog(@"%@",self.tabBar);
}

-(void)viewWillAppear:(BOOL)animated {
   // [super viewWillAppear:animated];
    //   NSLog(@"%@",self.tabBar.subviews);
       NSLog(@"%s",__func__);
}


-(void) viewDidAppear:(BOOL)animated {
       NSLog(@"%s",__func__);
   // [super viewDidAppear:YES];
  //  NSLog(@"%@",self.tabBar.subviews);
}

-(void)setUpAllChildViewController {
    //首页
    EThomeController *home = [[EThomeController alloc]init];
    [self setUpDetailViewController:home tittle:@"首页" image:[UIImage imageNamed:@"tabbar_home"] selectedIamge:[UIImage imageNoRendeWithName:@"tabbar_home_selected"]];
    home.view.backgroundColor = [UIColor blueColor];
    //消息
    ETMessageController *message = [[ETMessageController alloc]init];
    [self setUpDetailViewController:message tittle:@"消息" image:[UIImage imageNamed:@"tabbar_message_center"] selectedIamge:[UIImage imageNoRendeWithName:@"tabbar_message_center_selected"]];
    message.view.backgroundColor = [UIColor yellowColor];
    //发现
    ETDiscoverController *discover = [[ETDiscoverController alloc]init];
    [self setUpDetailViewController:discover tittle:@"发现" image:[UIImage imageNamed:@"tabbar_discover"] selectedIamge:[UIImage imageNoRendeWithName:@"tabbar_discover_selected"]];
    discover.view.backgroundColor = [UIColor grayColor];
    //我
    ETProfileController *profile = [[ETProfileController alloc]init];
    [self setUpDetailViewController:profile tittle:@"我" image:[UIImage imageNamed:@"tabbar_profile"] selectedIamge:[UIImage imageNoRendeWithName:@"tabbar_profile_selected"]];
    profile.view.backgroundColor = [UIColor orangeColor];
}
/**
 *   设置每个字菜单的控制器
 *
 *  @param ViewControl   子菜单
 *  @param Tittle        标题
 *  @param Image         图片
 *  @param SelectedImage 被选中后的高亮图片
 */

-(void)setUpDetailViewController:(UIViewController *)ViewControl tittle:(NSString *)Tittle image:(UIImage *) Image selectedIamge : (UIImage *) SelectedImage{
    ViewControl.title =Tittle ;  //这一句相当于执行了下面两句
//    ViewControl.tabBarItem.title = Tittle;
//    ViewControl.navigationItem.title = Tittle;
   
    ViewControl.tabBarItem.image =Image;
    ViewControl.tabBarItem.badgeValue = @"10";
    ViewControl.tabBarItem.selectedImage = SelectedImage;
    ETNavController *NavControl = [[ETNavController alloc]initWithRootViewController:ViewControl];
    [self addChildViewController:NavControl];
}
@end









