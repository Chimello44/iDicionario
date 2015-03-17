//
//  MViewController.m
//  Navigation
//
//  Created by Hugo Luiz Chimello on 3/17/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "MViewController.h"
#import "ViewController.h"

@interface MViewController ()

@end

@implementation MViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIButton *botao=[UIButton buttonWithType:UIButtonTypeSystem];
    [botao setTitle:@"Começar" forState:UIControlStateNormal];
    [botao sizeToFit];
    [botao addTarget:self action:@selector(next:) forControlEvents:UIControlEventTouchUpInside];
    botao.center=self.view.center;
    [self.view addSubview:botao];
    
    
    
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
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end