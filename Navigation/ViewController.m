//
//  ViewController.m
//  Navigation
//
//  Created by Hugo Luiz Chimello on 3/16/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()

@end

@implementation ViewController
@synthesize ms;
-(void) viewDidLoad {
    [super viewDidLoad];
    ms =[MySingleton singleObj];
    
    
    
    ///////////////
    
    self.title = [ms.word objectAtIndex:ms.contador];
    
    NSLog(@"deu?");
    UIBarButtonItem *next = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(next:)];
    
    UIBarButtonItem *back = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(back:)];
    self.navigationItem.rightBarButtonItem=next;
    self.navigationItem.leftBarButtonItem=back;
    
    ///////////////
    
    UIImageView *im =[[UIImageView alloc] initWithFrame:CGRectMake(130,130,130,130)];
    im.image=[UIImage imageNamed:[ms.img objectAtIndex:ms.contador]];
    [self.view addSubview:im];
    
    UIButton *botao = [UIButton
                       buttonWithType:UIButtonTypeSystem];
    [botao
     setTitle:@"Leia"
     forState:UIControlStateNormal];
    [botao sizeToFit];
    botao.center = self.view.center;
    
    [self.view addSubview:botao];
    
    
}

-(void)next:(id)sender {
    ViewController *proximo = [[ViewController alloc]
                                     initWithNibName:nil
                                     bundle:NULL];
    ms.contador++;
    [self.navigationController pushViewController:proximo
                                         animated:YES];
   [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)back:(id)sender {
    
    ViewController *anterior = [[ViewController alloc]
                                initWithNibName:nil
                                bundle:NULL];
    
    ms.contador--;
    [self.navigationController pushViewController:anterior
                                         animated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}



@end
