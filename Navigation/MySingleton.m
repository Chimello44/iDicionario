//
//  MySingleton.m
//  Navigation
//
//  Created by Hugo Luiz Chimello on 3/16/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "MySingleton.h"

@implementation MySingleton

@synthesize word,img,sound,contador;


static MySingleton *single=nil;
+(MySingleton *)singleObj{
    
    
        if(nil==single){
            single=[[super alloc]init];
            }
        
        return single;
}
-(id) init {
    
    if (self=[super init]) {
        
        word = [[NSArray alloc] initWithObjects:@"Apple",@"Balloon",@"Candy",@"Dice",@"Elephant",@"Flute",@"Game",@"Hippopotamus",@"Iron",@"Jail",@"Key",@"Lamp",@"Magazine",@"Necklace",@"Office",@"Paint",@"Quick",@"Rain",@"Sandwich",@"Tomato",@"Umbrella",@"Vegetables",@"Waitress",@"Xylophone",@"Yellow",@"Zebra", nil];
        
        img = [[NSArray alloc]initWithObjects:@"Apple.jpg",@"Balloon.jpg",@"Candy.png",@"Dice",@"Elephant",@"Flute",@"Game",@"Hippopotamus",@"Iron",@"Jail",@"Key",@"Lamp",@"Magazine",@"Necklace",@"Office",@"Paint",@"Quick",@"Rain",@"Sandwich",@"Tomato",@"Umbrella",@"Vegetables",@"Waitress",@"Xylophone",@"Yellow",@"Zebra", nil];
        contador=0;
        
    }
    return self;
}

@end
