//
//  MySingleton.h
//  Navigation
//
//  Created by Hugo Luiz Chimello on 3/16/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>
#import "MyRealm.h"

@interface MySingleton : NSObject{
    NSArray *img;
    NSArray *word;
    NSArray *sound;
    NSArray *letter;
    NSArray *imgmain;
    NSArray *letterjogo;
    MySingleton *ms;
    
}
@property(nonatomic,retain) NSArray *word;
@property(nonatomic,retain) NSArray *img;
@property(nonatomic,retain) NSArray *sound;
@property(nonatomic,retain) NSArray *letter;
@property(nonatomic,retain) NSArray *letterjogo;
-(void) novocontador:(int)novo;
@property(nonatomic,retain) NSArray *imgmain;
@property int contador;
@property int contadorjogo;
+(MySingleton *) singleObj;

-(void)iniciandoBancoDados;
-(MyRealm *)buscaObjetoBancoDadosWithIndex:(int)contador;



@end

//word =(@"Apple",@"Balloon",@"Candy",@"Dice",@"Elephant",@"Flute",@"Hippopotamus",@"Iron",@"Jail",@"Key",@"Lamp",@"Magazine",@"Necklace",@"Office",@"Paint",@"Quick",@"Rain",@"Sandwich",@"Tomato",@"Umbrella",@"Vegetables",@"Waitress",@"",@"",@"");
//img =(@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"");
//sound =(@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"");