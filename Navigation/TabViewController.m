//
//  TabViewController.m
//  Navigation
//
//  Created by Hugo Luiz Chimello on 3/18/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "TabViewController.h"
#import "ViewController.h"
#import "MViewController.h"
#import "MySingleton.h"
#import "TableViewController.h"

@interface TabViewController ()

@end

@implementation TabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ViewController *viewController=[[ViewController alloc]initWithNibName:nil bundle:nil];
    
    UINavigationController *navigator=[[UINavigationController alloc]initWithRootViewController:viewController];
    
    TableViewController *table=[[TableViewController alloc]init];
    
    NSArray *view=[[NSArray alloc]initWithObjects:navigator,table, nil];
    [self setViewControllers:view];
    
    navigator.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"Carros" image:nil tag:1];
    table.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"Tabela" image:nil tag:2];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
