//
//  MySingleton.m
//  Navigation
//
//  Created by Hugo Luiz Chimello on 3/16/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "MySingleton.h"

@implementation MySingleton

@synthesize word,img,sound,contador,letter;


static MySingleton *single=nil;
+(MySingleton *)singleObj{
    
    
        if(nil==single){
            single=[[super alloc]init];
            }
        
        return single;
}
-(id) init {
    
    if (self=[super init]) {
        
        
        letter=[[NSArray alloc]initWithObjects:@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z", nil];
        
        word = [[NSArray alloc] initWithObjects:@"Astra",@"Bentley",@"Cadillac",@"DeLorean",@"Eclipse",@"Ferrari",@"Gurgel",@"Hummer",@"Impala",@"Jaguar",@"Kombi",@"Lincoln",@"McLaren",@"Neon",@"Opala",@"Parati",@"Qashqai",@"Ranger",@"Santana",@"Thunderbird",@"Uno",@"Veraneio",@"Wagoneer",@"Xsara",@"Yaris",@"Zagatto", nil];
        img = [[NSArray alloc] initWithObjects:@"Apple.jpg",@"Balloon.jpg",@"Cadillac",@"DeLorean",@"Eclipse",@"Ferrari",@"Gurgel",@"Hummer",@"Impala",@"Jaguar",@"Kombi",@"Lincoln",@"McLaren",@"Neon",@"Opala",@"Parati",@"Qashqai",@"Ranger",@"Santana",@"Thunderbird",@"Uno",@"Veraneio",@"Wagoneer",@"Xsara",@"Yaris",@"Zagatto", nil];
        
        
        contador=0;
        
    }
    return self;
}

@end
