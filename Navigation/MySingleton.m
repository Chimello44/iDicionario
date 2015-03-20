//
//  MySingleton.m
//  Navigation
//
//  Created by Hugo Luiz Chimello on 3/16/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "MySingleton.h"
#import <Realm/Realm.h>
#import "MyRealm.h"

@implementation MySingleton

@synthesize word,img,sound,contador,contadorjogo,letter,imgmain, letterjogo;


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
        img = [[NSArray alloc] initWithObjects:@"Astra.jpg",@"Bentley.jpg",@"Cadillac.jpg",@"DeLorean.jpg",@"Eclipse.jpg",@"Ferrari.jpg",@"Gurgel.jpg",@"Hummer.jpg",@"Impala.jpg",@"Jaguar.jpg",@"Kombi.jpg",@"Lincoln.jpg",@"McLaren.jpg",@"Neon.jpg",@"Opala.jpg",@"Parati.jpg",@"Qashqai.jpg",@"Ranger.jpg",@"Santana.jpg",@"Thunderbird.jpg",@"Uno.jpg",@"Veraneio.jpg",@"Wagonner.jpg",@"Xsara.jpg",@"Yaris.jpg",@"Zagatto.jpg", nil];
        
        //------------------------------------------------------------------- JOGO
        imgmain=[[NSArray alloc] initWithObjects:@"car", @"game",@"car2",nil];
        
        letterjogo=[[NSArray alloc]initWithObjects:@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z", nil];
         //------------------------------------------------------------------- JOGO
        contador=0;
        contadorjogo=0;
        
    }
    return self;
}

-(void) novocontador:(int)novo{
    contador=novo;
}

-(void)iniciandoBancoDados{
    letter=[[NSArray alloc]initWithObjects:@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z", nil];
    
    word = [[NSArray alloc] initWithObjects:@"Astra",@"Bentley",@"Cadillac",@"DeLorean",@"Eclipse",@"Ferrari",@"Gurgel",@"Hummer",@"Impala",@"Jaguar",@"Kombi",@"Lincoln",@"McLaren",@"Neon",@"Opala",@"Parati",@"Qashqai",@"Ranger",@"Santana",@"Thunderbird",@"Uno",@"Veraneio",@"Wagoneer",@"Xsara",@"Yaris",@"Zagatto", nil];
    img = [[NSArray alloc] initWithObjects:@"Astra.jpg",@"Bentley.jpg",@"Cadillac.jpg",@"DeLorean.jpg",@"Eclipse.jpg",@"Ferrari.jpg",@"Gurgel.jpg",@"Hummer.jpg",@"Impala.jpg",@"Jaguar.jpg",@"Kombi.jpg",@"Lincoln.jpg",@"McLaren.jpg",@"Neon.jpg",@"Opala.jpg",@"Parati.jpg",@"Qashqai.jpg",@"Ranger.jpg",@"Santana.jpg",@"Thunderbird.jpg",@"Uno.jpg",@"Veraneio.jpg",@"Wagonner.jpg",@"Xsara.jpg",@"Yaris.jpg",@"Zagatto.jpg", nil];
    
    //------------------------------------------------------------------- JOGO
    imgmain=[[NSArray alloc] initWithObjects:@"car", @"game",@"car2",nil];
    
    letterjogo=[[NSArray alloc]initWithObjects:@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z", nil];
    //------------------------------------------------------------------- JOGO
    
    RLMRealm *realm=[RLMRealm defaultRealm];
    
    for(int i=0;i<letter.count;i++){
        MyRealm *objeto =[[MyRealm alloc]init];
        objeto.letter=[letter objectAtIndex:i];
        objeto.word=[word objectAtIndex:i];
        objeto.img=[img objectAtIndex:i];
        objeto.imgmain=[imgmain objectAtIndex:i];
        objeto.letterjogo=[letterjogo objectAtIndex:i];
        objeto.contador=i;
        
        [realm beginWriteTransaction];
        
        [realm addObject:objeto];
        
        [realm commitWriteTransaction];
    
    
        
    }
}

-(MyRealm *)buscaObjetoBancoDadosWithIndex:(int)contador{
    NSPredicate *pred=[NSPredicate predicateWithFormat:@"contador == %i", contador];
    RLMResults *results=[MyRealm objectsWithPredicate:pred];
    
    if(results.count==0)
        return nil;
    
    return results.firstObject;
}
@end
