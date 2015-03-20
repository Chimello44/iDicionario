//
//  MyRealm.h
//  Navigation
//
//  Created by Hugo Luiz Chimello on 3/20/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Realm/Realm.h>

@interface MyRealm : RLMObject

@property (nonatomic,strong) NSString *letter;
@property (nonatomic,strong) NSString *word;
@property (nonatomic,strong) NSString *img;
@property (nonatomic,strong) NSString *imgmain;
@property (nonatomic,strong) NSString *letterjogo;
@property (nonatomic) int contador;
@end
