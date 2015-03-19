//
//  ViewController.m
//  Navigation
//
//  Created by Hugo Luiz Chimello on 3/16/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//
//https://joguestop.wordpress.com/2012/12/01/alfabeto-de-carros/
#import "ViewController.h"
#import "MViewController.h"
#import "MainTabViewController.h"



@interface ViewController ()

@end
UIButton *botaoBusca;
UITextField *textBusca;
@implementation ViewController
@synthesize ms,im;
-(void) viewDidLoad {
    [super viewDidLoad];
    ms =[MySingleton singleObj];
    
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    ///////////////////////
    
    self.navigationItem.title = [ms.letter objectAtIndex:ms.contador];
    
    NSLog(@"deu?");
    UIBarButtonItem *next = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(next:)];
    
    UIBarButtonItem *back = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(back:)];
    self.navigationItem.rightBarButtonItem=next;
    self.navigationItem.leftBarButtonItem=back;
    
    ///////////////////////
    
    
    
    //self.im.layer.cornerRadius = 10.0f;
    
    
    ////////////
    UIButton *botao = [UIButton
                       buttonWithType:UIButtonTypeSystem];
    [botao
     setTitle:[ms.word objectAtIndex:ms.contador]
     forState:UIControlStateNormal];
    [botao addTarget:self action:@selector(speak:) forControlEvents:UIControlEventTouchUpInside];
    [botao sizeToFit];
    botao.frame = CGRectMake(120,400,100,50);
    
    [self.view addSubview:botao];
    
    //////// botao p/main
    
    UIButton *botaoo=[UIButton buttonWithType:UIButtonTypeSystem];
    [botaoo setTitle:@"Main" forState:UIControlStateNormal];
    [botaoo sizeToFit];
    botaoo.frame = CGRectMake(120,500,100,50);
    [botaoo addTarget:self action:@selector(main:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:botaoo];
    
    ///////////////////   BOTAO BUSCA
    textBusca=[[UITextField alloc]initWithFrame:CGRectMake(10,64,300,30)];
    textBusca.textAlignment=NSTextAlignmentLeft;
    textBusca.borderStyle=UITextBorderStyleRoundedRect;
    textBusca.font=[UIFont systemFontOfSize:12];
    textBusca.placeholder=@"Pesquisar carro";
    textBusca.keyboardType=UIKeyboardTypeDefault;
    textBusca.returnKeyType =UIReturnKeyDone;
    textBusca.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    textBusca.delegate=self;
    ///////////////////   TEXT BUSCA
    
    botaoBusca=[UIButton buttonWithType:UIButtonTypeSystem];
    //botaoBusca addTarget:self action:@selector(buscarCarro:) forControlEvents:UIControlEventTouchUpInside];
    [botaoBusca setTitle:@"Busca"forState:UIControlStateNormal];
    botaoBusca.frame = CGRectMake(62,100,200,30);
    
    
    [self.view addSubview:textBusca];
    [self.view addSubview:botaoBusca];
}
-(void)buscarCarro:(id)sender{
    
}
-(void)viewWillAppear:(BOOL)animated{
    im =[[UIImageView alloc] initWithFrame:CGRectMake(250,250,250,250)];
    im.image=[UIImage imageNamed:[ms.img objectAtIndex:ms.contador]];
    [self.view addSubview:im];
    [im.layer setBorderColor: [[UIColor blackColor] CGColor]];
    [im.layer setBorderWidth: 1.0];
    im.center=self.view.center;
    //im.layer.mastobounds corta se passar da borda!
    im.layer.masksToBounds = YES;
    im.contentMode = UIViewContentModeScaleAspectFit;
    self.im.layer.cornerRadius = 125.0f;
    
        im.userInteractionEnabled = YES;
    
    UILongPressGestureRecognizer *rec = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(expansion:)];
    
    [im addGestureRecognizer:rec];
}
///////////////////////////////////////////////    funcao fala
-(void)speak:(id)sender{
    NSLog(@"speak");
AVSpeechSynthesizer *synthesizer = [[AVSpeechSynthesizer alloc]init];
AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:[ms.word objectAtIndex:ms.contador]];
[utterance setPitchMultiplier:1.15f];
utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"en-US"];
[utterance setRate:0.03f];
[synthesizer speakUtterance:utterance];
    
}

///////////////////////////////////////////////   botao para proximo
-(void)next:(id)sender {
    ViewController *proximo = [[ViewController alloc]
                                     initWithNibName:nil
                                     bundle:NULL];
    ms.contador++;
    if(ms.contador==26){
        ms.contador=0;
    }
    [self.navigationController pushViewController:proximo
                                         animated:NO];
   [self dismissViewControllerAnimated:YES completion:nil];
}
///////////////////////////////////////////////// botao para voltar para o main
-(void)main:(id)sender {
    MViewController *proximo = [[MViewController alloc]
                                initWithNibName:nil
                                bundle:NULL];
    
    [self.navigationController pushViewController:proximo
                                         animated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}
/////////////////////////////////////////////////   botao para a anterior
-(void)back:(id)sender {
    
    ViewController *anterior = [[ViewController alloc]
                                initWithNibName:nil
                                bundle:NULL];
    
    ms.contador--;
    
    if(ms.contador==-1){
        ms.contador=25;
    }
    
    [self.navigationController pushViewController:anterior
                                         animated:NO];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


///////////////////////////////////////////   metodo para animacao de zoom na imagem

-(void)expansion:(UILongPressGestureRecognizer*)sender{
    if(sender.state==UIGestureRecognizerStateBegan){
[UIView animateWithDuration:0.5 animations:^{
    im.transform=CGAffineTransformMakeScale(1.2f,1.2f);
}];
    }
    if (sender.state == UIGestureRecognizerStateEnded) {
        [UIView animateWithDuration:0.5 animations:^{
            im.transform=CGAffineTransformMakeScale(1.f,1.f);
        }];
    }
}




@end
