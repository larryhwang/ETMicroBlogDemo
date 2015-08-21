//
//  ETDiscoverController.m
//  ETWeibo
//
//  Created by Larry on 15/8/21.
//  Copyright (c) 2015年 Larry. All rights reserved.
//

#import "ETDiscoverController.h"

@implementation ETDiscoverController



#pragma mark -TableView DataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *ID = @"UIDCELl";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:ID];
    if(cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.textLabel.text =[NSString stringWithFormat:@"测试数据%ld",indexPath.row];
    }
        return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%ld",indexPath.row);
    UIViewController *NewVc = [[UIViewController alloc]init];
    NewVc.view.backgroundColor = [UIColor purpleColor];
    NewVc.title = @"啊哈";
    [self.navigationController pushViewController:NewVc animated:YES];
    
}

@end
