//
//  MViewController.h
//  Navigation
//
//  Created by Hugo Luiz Chimello on 3/17/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MySingleton.h"

@interface MViewController : UIViewController
@property MySingleton* ms;
@property UIImageView *im;
@property UIImageView *im2;
-(void)next:(id)sender;

@end
