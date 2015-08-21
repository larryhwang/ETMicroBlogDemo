//
//  ETNavigationController.m
//  ETWeibo
//
//  Created by Larry on 15/8/21.
//  Copyright (c) 2015年 Larry. All rights reserved.
//

#import "ETNavController.h"

@implementation ETNavController



-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.viewControllers.count > 0) {
        //viewControllers 为子控制器，这里的第一个控制起roootViewController 即“首页”、或者其他导航控制器
        viewController.hidesBottomBarWhenPushed = YES;
    }
   [super pushViewController:viewController animated:YES];   // 父类调用放在最后面执行
}
@end
