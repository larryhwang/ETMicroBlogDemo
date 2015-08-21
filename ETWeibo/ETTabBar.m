//
//  ETTabBar.m
//  ETWeibo
//
//  Created by Larry on 15/8/19.
//  Copyright (c) 2015年 Larry. All rights reserved.
//

#import "ETTabBar.h"

@interface ETTabBar ()

@property(nonatomic,weak) UIButton *plusButton;    //自定义的中间按钮

@end



@implementation ETTabBar

//懒加载
-(UIButton *)plusButton {
    if (_plusButton == nil) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"tabbar_compose_background_icon_add"] forState:UIControlStateHighlighted];
        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        
        [btn sizeToFit];   //按钮自动根据背景图片或者文字来确定最合适的尺寸
        _plusButton = btn;
        
        [self addSubview:_plusButton];
    }
    return _plusButton;
}

-(void) layoutSubviews {
    [super layoutSubviews];
    CGFloat w = self.bounds.size.width;
    CGFloat h = self.bounds.size.height;
    
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    CGFloat btnW = w / (self.items.count + 1 );
    CGFloat btnH = h;
    
    //重新摆放子item的距离
    
    int  i = 0;
    
    for (UIView *tabBarBtn in  self.subviews) {
        if ([tabBarBtn isKindOfClass:NSClassFromString(@"UITabBarButton")]) {  //反射机制，通过string反射到class
            if (i == 2) {
                i = i + 1;
            }
            btnX = i * btnW;
            tabBarBtn.frame  = CGRectMake(btnX, btnY, btnW, btnH);
            i ++ ;
        }
    }
    
    self.plusButton.center = CGPointMake(0.5*w, 0.5*h);

}
@end
