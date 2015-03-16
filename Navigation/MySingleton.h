//
//  MySingleton.h
//  Navigation
//
//  Created by Hugo Luiz Chimello on 3/16/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MySingleton : NSObject{
    NSArray *img;
    NSArray *word;
    NSArray *sound;
    
    MySingleton *ms;
    
}
@property(nonatomic,retain) NSArray *word;
@property(nonatomic,retain) NSArray *img;
@property(nonatomic,retain) NSArray *sound;
@property int contador;
+(MySingleton *) singleObj;

@end

//word =(@"Apple",@"Balloon",@"Candy",@"Dice",@"Elephant",@"Flute",@"Hippopotamus",@"Iron",@"Jail",@"Key",@"Lamp",@"Magazine",@"Necklace",@"Office",@"Paint",@"Quick",@"Rain",@"Sandwich",@"Tomato",@"Umbrella",@"Vegetables",@"Waitress",@"",@"",@"");
//img =(@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"");
//sound =(@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"");