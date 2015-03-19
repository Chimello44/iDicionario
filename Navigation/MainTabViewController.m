//
//  MainTabViewController.m
//  Navigation
//
//  Created by Hugo Luiz Chimello on 3/19/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "MainTabViewController.h"
#import "MViewController.h"
#import "TableViewController.h"
@interface MainTabViewController ()

@end

@implementation MainTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    MViewController *viewController=[[MViewController alloc]initWithNibName:nil bundle:nil];
//    UINavigationController *navigator=[[UINavigationController alloc]initWithRootViewController:viewController];
//    
//
//    TableViewController *table=[[TableViewController alloc]init];
//    
//    NSArray *view=[[NSArray alloc]initWithObjects:navigator,table, nil];
//    [self setViewControllers:view];
    
//    navigator.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"Carros" image:nil tag:1];
//    table.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"Tabela" image:nil tag:2];
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
