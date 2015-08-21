//
//  UIImage+ETRemRender.m
//  ETWeibo
//
//  Created by Larry on 15/8/19.
//  Copyright (c) 2015年 Larry. All rights reserved.
//

#import "UIImage+ETRemRender.h"

@implementation UIImage (ETRemRender)

+(instancetype)imageNoRendeWithName:(NSString *)name {
    UIImage *img  = [UIImage imageNamed:name];
   return  [img imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
 
}

@end
