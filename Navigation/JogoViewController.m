//
//  JogoViewController.m
//  Navigation
//
//  Created by Hugo Luiz Chimello on 3/18/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "JogoViewController.h"
#import "MViewController.h"

@interface JogoViewController ()

@end
UITextField *textCarro;
@implementation JogoViewController
@synthesize ms,im;
-(void) viewDidLoad {
    
    
    
    [super viewDidLoad];
    ms =[MySingleton singleObj];
    
    [self.tabBarController.tabBar setHidden:YES];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    ///////////////
    
    self.title = [ms.letterjogo objectAtIndex:ms.contadorjogo];
    
    NSLog(@"deu?");
    UIBarButtonItem *next = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(next:)];
    
    UIBarButtonItem *back = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(back:)];
    self.navigationItem.rightBarButtonItem=next;
    self.navigationItem.leftBarButtonItem=back;
    
    
   
    //////////////////////////// botao p/main
    
    UIButton *botaoo=[UIButton buttonWithType:UIButtonTypeSystem];
    [botaoo setTitle:@"Main" forState:UIControlStateNormal];
    [botaoo sizeToFit];
    botaoo.frame = CGRectMake(120,400,100,50);
    [botaoo addTarget:self action:@selector(main:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:botaoo];
    
    //////////////////////////
    
    
    
    //////////--------- TOOLBAR//Edit#@
    
    self.navigationController.toolbarHidden=NO;
    UIBarButtonItem *flexItem =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(edit:)] ;
    UIBarButtonItem *take=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(takePhoto:)] ;
    UIBarButtonItem *gallery=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addPhoto:)] ;
    
   NSArray *items =[NSArray arrayWithObjects:take,flexItem,item,flexItem,gallery, nil];
   self.toolbarItems=items;
    
    //////////////////////
    
    ///////////////// NOME CARRO
    
    textCarro=[[UITextField alloc]initWithFrame:CGRectMake(10,64,300,30)];
    textCarro.textAlignment=NSTextAlignmentLeft;
    
    textCarro.font=[UIFont systemFontOfSize:12];
    textCarro.placeholder=@"NOME DO CARRO";
    textCarro.keyboardType=UIKeyboardTypeDefault;
    textCarro.returnKeyType =UIReturnKeyDone;
    textCarro.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    textCarro.delegate=self;
    
    [self.view addSubview:textCarro];
}


  -(void)edit:(id)sender {
      
  }
-(void)viewWillAppear:(BOOL)animated{
    im =[[UIImageView alloc] initWithFrame:CGRectMake(250,250,250,250)];
    im.image=[UIImage imageNamed:[ms.imgmain objectAtIndex:2]];
    [self.view addSubview:im];
    [im.layer setBorderColor: [[UIColor blackColor] CGColor]];
    [im.layer setBorderWidth: 1.0];
    im.center=self.view.center;
    //im.layer.mastobounds corta se passar da borda!
    im.layer.masksToBounds = YES;
    im.contentMode = UIViewContentModeScaleAspectFit;
    self.im.layer.cornerRadius = 125.0f;
    
    im.userInteractionEnabled = YES;
    
//    UILongPressGestureRecognizer *rec = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(expansion:)];
//    
//    [im addGestureRecognizer:rec];
}



///////////////////////////////////////////////   botao para proximo
-(void)next:(id)sender {
    JogoViewController *proximo = [[JogoViewController alloc]
                               initWithNibName:nil
                               bundle:NULL];
    ms.contadorjogo++;
    if(ms.contadorjogo==26){
        ms.contadorjogo=0;
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
    
    JogoViewController *anterior = [[JogoViewController alloc]
                                initWithNibName:nil
                                bundle:NULL];
    
    ms.contadorjogo--;
    
    if(ms.contadorjogo==-1){
        ms.contadorjogo=25;
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

- (void)addPhoto:(id)sender {

    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;

    [self presentViewController:picker animated:YES completion:NULL];

}

- (void)takePhoto:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;

    [self presentViewController:picker animated:YES completion:NULL];

}

#pragma mark - Image Picker Controller delegate methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {

    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.im.image = chosenImage;

    im = [info objectForKey:UIImagePickerControllerReferenceURL];

    [picker dismissViewControllerAnimated:YES completion:NULL];

}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}



@end
