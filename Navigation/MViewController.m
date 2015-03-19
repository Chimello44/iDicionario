//
//  MViewController.m
//  Navigation
//
//  Created by Hugo Luiz Chimello on 3/17/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "MViewController.h"
#import "ViewController.h"
#import "JogoViewController.h"
#import "TableViewController.h"
#import "MainTabViewController.h"



@interface MViewController ()

@end

@implementation MViewController
@synthesize ms,im,im2;
- (void)viewDidLoad {
    [super viewDidLoad];
    ms =[MySingleton singleObj];

    
//    UIButton *botao=[UIButton buttonWithType:UIButtonTypeSystem];
//    [botao setTitle:@"Começar" forState:UIControlStateNormal];
//    [botao sizeToFit];
//    [botao addTarget:self action:@selector(next:) forControlEvents:UIControlEventTouchUpInside];
//    botao.center=self.view.center;
//    [self.view addSubview:botao];
//    botao.frame = CGRectMake(120,500,100,50); nn
    
    self.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"Carros" image:nil tag:1];
   
}

-(void) viewWillAppear:(BOOL)animated{
    
    //-----------------------------img1
    im=[[UIImageView alloc] initWithFrame:CGRectMake(5,self.view.center.y-100,150,150)];
    
    im.image=[UIImage imageNamed:[ms.imgmain objectAtIndex:ms.contador]];
    [self.view addSubview:im];
    [im.layer setBorderColor: [[UIColor blackColor] CGColor]];
    [im.layer setBorderWidth: 1.0];
    im.layer.masksToBounds = YES;
    im.contentMode = UIViewContentModeScaleAspectFit;
    self.im.layer.cornerRadius = 75.0f;
   im.userInteractionEnabled = YES;
    UITapGestureRecognizer *rec = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(next:)];
    
    [im addGestureRecognizer:rec];
    
    
    //-----------------------------img1
    
    
    
    
    //-----------------------------img2
    
    
    im2=[[UIImageView alloc] initWithFrame:CGRectMake(self.view.center.x,self.view.center.y-100,150,150)];
    im2.image=[UIImage imageNamed:[ms.imgmain objectAtIndex:1]];
    [self.view addSubview:im2];
    [im2.layer setBorderColor: [[UIColor blackColor] CGColor]];
    [im2.layer setBorderWidth: 1.0];
    
    
    im2.layer.masksToBounds = YES;
    im2.contentMode = UIViewContentModeScaleAspectFit;
    self.im2.layer.cornerRadius = 75.0f;
    
    
    
    im2.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *rec2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(next2:)];
    
    [im2 addGestureRecognizer:rec2];
    
    //-----------------------------img2
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(void)next:(id)sender {
ViewController *proximo = [[ViewController alloc]
                               initWithNibName:nil
                               bundle:NULL];
    
    [self.navigationController pushViewController:proximo
                                         animated:YES];
    
//    [self tabBarController show=YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)next2:(id)sender {
    JogoViewController *proximo = [[JogoViewController alloc]
                               initWithNibName:nil
                               bundle:NULL];
    
    [self.navigationController pushViewController:proximo
                                         animated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end