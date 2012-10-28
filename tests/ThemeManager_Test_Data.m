//
//  ThemeManager_Test_Data.m
//  WhatIsThat
//
//  Created by Damien Murtagh on 7/30/12.
//  Copyright (c) 2012 Playfirst. All rights reserved.
//

#import "ThemeManager_Test_Data.h"
#import "SBJSON.h"

@implementation ThemeManager_Test_Data

+ (void)addThemeTo:(NSMutableArray*)array word:(NSString *)word tags:(NSString*)tags, ...
{
    va_list args;
    va_start(args, tags);
    NSMutableArray * tagsArray = [[NSMutableArray alloc] init];
    for (NSString *arg = tags; arg != nil; arg = va_arg(args, NSString*))
    {
        [tagsArray addObject:arg];
    }
    va_end(args);
    
    NSMutableDictionary * dict = [[NSMutableDictionary alloc] init];
    [dict setObject:word forKey:@"word"];
    [dict setObject:tagsArray forKey:@"tags"];
    [array addObject:dict];
}

+ (void)createTestData
{
    NSMutableArray * allThemes = [[NSMutableArray alloc] init];
    [self addThemeTo:allThemes word:@"1960's" tags:@"time", @"music", @"fashion", nil];
    [self addThemeTo:allThemes word:@"Medieval" tags:@"time", nil];
    [self addThemeTo:allThemes word:@"Romantic" tags:@"abstract", @"genre", nil];
    [self addThemeTo:allThemes word:@"Lady Gaga" tags:@"pop", @"music", @"person", nil];
    [self addThemeTo:allThemes word:@"Summer" tags:@"time", nil];
    [self addThemeTo:allThemes word:@"The Kardashians" tags:@"person", @"fashion", nil];
    [self addThemeTo:allThemes word:@"Comedy" tags:@"abstract", @"genre", nil];
    [self addThemeTo:allThemes word:@"Loony Tunes" tags:@"tv", nil];
    
    ///////// - Data
    
    // FILM
    [self addThemeTo:allThemes word:@"Noir" tags:@"FILM", nil];
    [self addThemeTo:allThemes word:@"Horror" tags:@"FILM", nil];
    [self addThemeTo:allThemes word:@"Sci-Fi" tags:@"FILM", nil];
    [self addThemeTo:allThemes word:@"Pulp/Crime" tags:@"FILM", nil];
    [self addThemeTo:allThemes word:@"Action" tags:@"FILM", nil];
    [self addThemeTo:allThemes word:@"Loony Tunes/Cartoon" tags:@"FILM", nil];
    [self addThemeTo:allThemes word:@"Comedy" tags:@"FILM", nil];
    [self addThemeTo:allThemes word:@"Romantic" tags:@"FILM", nil];
    [self addThemeTo:allThemes word:@"Drama" tags:@"FILM", nil];
    [self addThemeTo:allThemes word:@"Musical" tags:@"FILM", nil];
    [self addThemeTo:allThemes word:@"Zombie" tags:@"FILM", nil];
    [self addThemeTo:allThemes word:@"Grindhouse" tags:@"FILM", nil];
    [self addThemeTo:allThemes word:@"Samurai" tags:@"FILM", nil];
    [self addThemeTo:allThemes word:@"Silent" tags:@"FILM", nil];
    [self addThemeTo:allThemes word:@"Educational" tags:@"FILM", nil];
    
    // TIME PERIOD
    [self addThemeTo:allThemes word:@"1960s" tags:@"TIME PERIOD", nil];
    [self addThemeTo:allThemes word:@"1970s" tags:@"TIME PERIOD", nil];
    [self addThemeTo:allThemes word:@"1980s" tags:@"TIME PERIOD", nil];
    [self addThemeTo:allThemes word:@"1990s" tags:@"TIME PERIOD", nil];
    [self addThemeTo:allThemes word:@"Medeival" tags:@"TIME PERIOD", nil];
    [self addThemeTo:allThemes word:@"Prehistoric" tags:@"TIME PERIOD", nil];
    [self addThemeTo:allThemes word:@"Steampunk" tags:@"TIME PERIOD", nil];
    [self addThemeTo:allThemes word:@"Old West" tags:@"TIME PERIOD", nil];
    [self addThemeTo:allThemes word:@"Winter" tags:@"TIME PERIOD", nil];
    [self addThemeTo:allThemes word:@"Spring" tags:@"TIME PERIOD", nil];
    [self addThemeTo:allThemes word:@"Summer" tags:@"TIME PERIOD", nil];
    [self addThemeTo:allThemes word:@"Fall" tags:@"TIME PERIOD", nil];
    [self addThemeTo:allThemes word:@"Victorian" tags:@"TIME PERIOD", nil];
    [self addThemeTo:allThemes word:@"Ancient Egyptian" tags:@"TIME PERIOD", nil];
    
    // CELEBRITY
    [self addThemeTo:allThemes word:@"Lady Gaga" tags:@"CELEBRITY", nil];
    [self addThemeTo:allThemes word:@"President Obama" tags:@"CELEBRITY", nil];
    [self addThemeTo:allThemes word:@"Jersey Shore" tags:@"CELEBRITY", nil];
    [self addThemeTo:allThemes word:@"The Kardashians" tags:@"CELEBRITY", nil];
    [self addThemeTo:allThemes word:@"Madonna" tags:@"CELEBRITY", nil];
    [self addThemeTo:allThemes word:@"Michael Jackson" tags:@"CELEBRITY", nil];
    [self addThemeTo:allThemes word:@"Beatles" tags:@"CELEBRITY", nil];
    
    // HOLIDAY
    [self addThemeTo:allThemes word:@"Christmas" tags:@"HOLIDAY", nil];
    [self addThemeTo:allThemes word:@"Halloween" tags:@"HOLIDAY", nil];
    [self addThemeTo:allThemes word:@"Valentine's Day" tags:@"HOLIDAY", nil];
    [self addThemeTo:allThemes word:@"St. Patrick's Day" tags:@"HOLIDAY", nil];
    [self addThemeTo:allThemes word:@"Oktoberfest" tags:@"HOLIDAY", nil];
    [self addThemeTo:allThemes word:@"Independance Day" tags:@"HOLIDAY", nil];
    [self addThemeTo:allThemes word:@"Earth Day" tags:@"HOLIDAY", nil];
    [self addThemeTo:allThemes word:@"President's Day" tags:@"HOLIDAY", nil];
    [self addThemeTo:allThemes word:@"Anniversary" tags:@"HOLIDAY", nil];
    
    // POP CULTURE
    [self addThemeTo:allThemes word:@"Batman" tags:@"POP CULTURE", nil];
    [self addThemeTo:allThemes word:@"Video Games" tags:@"POP CULTURE", nil];
    [self addThemeTo:allThemes word:@"Hipster" tags:@"POP CULTURE", nil];
    [self addThemeTo:allThemes word:@"Furry" tags:@"POP CULTURE", nil];
    [self addThemeTo:allThemes word:@"Super Hero" tags:@"POP CULTURE", nil];
    [self addThemeTo:allThemes word:@"Super Villain" tags:@"POP CULTURE", nil];
    [self addThemeTo:allThemes word:@"Brony" tags:@"POP CULTURE", nil];
    [self addThemeTo:allThemes word:@"Goth" tags:@"POP CULTURE", nil];
    [self addThemeTo:allThemes word:@"Punk" tags:@"POP CULTURE", nil];
    [self addThemeTo:allThemes word:@"Preppy" tags:@"POP CULTURE", nil];
    [self addThemeTo:allThemes word:@"Emo" tags:@"POP CULTURE", nil];
    [self addThemeTo:allThemes word:@"Nerd" tags:@"POP CULTURE", nil];
    [self addThemeTo:allThemes word:@"Geek" tags:@"POP CULTURE", nil];
    [self addThemeTo:allThemes word:@"Hippy" tags:@"POP CULTURE", nil];
    [self addThemeTo:allThemes word:@"Twilight" tags:@"POP CULTURE", nil];
    
    // ART
    [self addThemeTo:allThemes word:@"Abstract" tags:@"ART", nil];
    [self addThemeTo:allThemes word:@"Impressionist" tags:@"ART", nil];
    [self addThemeTo:allThemes word:@"Cartoony" tags:@"ART", nil];
    [self addThemeTo:allThemes word:@"Psychedelic" tags:@"ART", nil];
    [self addThemeTo:allThemes word:@"Comic Book" tags:@"ART", nil];
    [self addThemeTo:allThemes word:@"Graffiti" tags:@"ART", nil];
    [self addThemeTo:allThemes word:@"Renaissance" tags:@"ART", nil];
    [self addThemeTo:allThemes word:@"Tattoo" tags:@"ART", nil];
    [self addThemeTo:allThemes word:@"Art Nouveau" tags:@"ART", nil];
    [self addThemeTo:allThemes word:@"Pointilism" tags:@"ART", nil];
    [self addThemeTo:allThemes word:@"Cubist" tags:@"ART", nil];
    [self addThemeTo:allThemes word:@"Modern" tags:@"ART", nil];
    
    // NOUNS
    [self addThemeTo:allThemes word:@"Flower" tags:@"NOUNS", nil];
    [self addThemeTo:allThemes word:@"Table" tags:@"NOUNS", nil];
    [self addThemeTo:allThemes word:@"Spoon" tags:@"NOUNS", nil];
    [self addThemeTo:allThemes word:@"Fan" tags:@"NOUNS", nil];
    [self addThemeTo:allThemes word:@"Bird" tags:@"NOUNS", nil];
    [self addThemeTo:allThemes word:@"Girl" tags:@"NOUNS", nil];
    [self addThemeTo:allThemes word:@"Boy" tags:@"NOUNS", nil];
    [self addThemeTo:allThemes word:@"Toy" tags:@"NOUNS", nil];
    [self addThemeTo:allThemes word:@"Boat" tags:@"NOUNS", nil];
    [self addThemeTo:allThemes word:@"Face" tags:@"NOUNS", nil];
    
    // VERBS
    [self addThemeTo:allThemes word:@"Walk" tags:@"VERBS", nil];
    [self addThemeTo:allThemes word:@"Sit" tags:@"VERBS", nil];
    [self addThemeTo:allThemes word:@"Jump" tags:@"VERBS", nil];
    [self addThemeTo:allThemes word:@"Spin" tags:@"VERBS", nil];
    [self addThemeTo:allThemes word:@"Spit" tags:@"VERBS", nil];
    [self addThemeTo:allThemes word:@"Scream" tags:@"VERBS", nil];
    [self addThemeTo:allThemes word:@"Fly" tags:@"VERBS", nil];
    [self addThemeTo:allThemes word:@"Cook" tags:@"VERBS", nil];
    [self addThemeTo:allThemes word:@"Devour" tags:@"VERBS", nil];
    
    // FEELINGS
    [self addThemeTo:allThemes word:@"Sad" tags:@"FEELINGS", nil];
    [self addThemeTo:allThemes word:@"It's Complicated" tags:@"FEELINGS", nil];
    [self addThemeTo:allThemes word:@"Scared" tags:@"FEELINGS", nil];
    [self addThemeTo:allThemes word:@"Annoyed" tags:@"FEELINGS", nil];
    
    // ANIMALS
    [self addThemeTo:allThemes word:@"Cat" tags:@"ANIMALS", nil];
    [self addThemeTo:allThemes word:@"Pig" tags:@"ANIMALS", nil];
    [self addThemeTo:allThemes word:@"Mouse" tags:@"ANIMALS", nil];
    [self addThemeTo:allThemes word:@"Emu" tags:@"ANIMALS", nil];
    [self addThemeTo:allThemes word:@"Lion" tags:@"ANIMALS", nil];
    [self addThemeTo:allThemes word:@"Kiwi" tags:@"ANIMALS", nil];
    [self addThemeTo:allThemes word:@"Dog" tags:@"ANIMALS", nil];
    [self addThemeTo:allThemes word:@"Elephant" tags:@"ANIMALS", nil];
    [self addThemeTo:allThemes word:@"Penguin" tags:@"ANIMALS", nil];
    [self addThemeTo:allThemes word:@"Giant Squid" tags:@"ANIMALS", nil];
    
    // COLORS
    [self addThemeTo:allThemes word:@"Red" tags:@"COLORS", nil];
    [self addThemeTo:allThemes word:@"Pink" tags:@"COLORS", nil];
    [self addThemeTo:allThemes word:@"Blue" tags:@"COLORS", nil];
    [self addThemeTo:allThemes word:@"Green" tags:@"COLORS", nil];
    [self addThemeTo:allThemes word:@"Yellow" tags:@"COLORS", nil];
    [self addThemeTo:allThemes word:@"Black" tags:@"COLORS", nil];
    [self addThemeTo:allThemes word:@"White" tags:@"COLORS", nil];
    [self addThemeTo:allThemes word:@"Grey" tags:@"COLORS", nil];
    [self addThemeTo:allThemes word:@"Brown" tags:@"COLORS", nil];
    
    // CLOTHING
    [self addThemeTo:allThemes word:@"Shirt" tags:@"CLOTHING", nil];
    [self addThemeTo:allThemes word:@"Vest" tags:@"CLOTHING", nil];
    [self addThemeTo:allThemes word:@"Jacket" tags:@"CLOTHING", nil];
    [self addThemeTo:allThemes word:@"Suit" tags:@"CLOTHING", nil];
    [self addThemeTo:allThemes word:@"Pants" tags:@"CLOTHING", nil];
    [self addThemeTo:allThemes word:@"Underwear" tags:@"CLOTHING", nil];
    [self addThemeTo:allThemes word:@"Swimsuit" tags:@"CLOTHING", nil];
    [self addThemeTo:allThemes word:@"Shoes" tags:@"CLOTHING", nil];
    [self addThemeTo:allThemes word:@"Socks" tags:@"CLOTHING", nil];
    [self addThemeTo:allThemes word:@"Skirt" tags:@"CLOTHING", nil];
    [self addThemeTo:allThemes word:@"Tuxedo" tags:@"CLOTHING", nil];
    [self addThemeTo:allThemes word:@"Ball Gown" tags:@"CLOTHING", nil];
    [self addThemeTo:allThemes word:@"Sweater" tags:@"CLOTHING", nil];
    [self addThemeTo:allThemes word:@"Top Hat" tags:@"CLOTHING", nil];
    [self addThemeTo:allThemes word:@"Onsie" tags:@"CLOTHING", nil];
    
    // FOOD
    [self addThemeTo:allThemes word:@"Fruit" tags:@"FOOD", nil];
    [self addThemeTo:allThemes word:@"Veggies" tags:@"FOOD", nil];
    [self addThemeTo:allThemes word:@"Steak" tags:@"FOOD", nil];
    [self addThemeTo:allThemes word:@"Potato" tags:@"FOOD", nil];
    [self addThemeTo:allThemes word:@"Water" tags:@"FOOD", nil];
    [self addThemeTo:allThemes word:@"Soda" tags:@"FOOD", nil];
    [self addThemeTo:allThemes word:@"Chicken" tags:@"FOOD", nil];
    [self addThemeTo:allThemes word:@"Pork" tags:@"FOOD", nil];
    [self addThemeTo:allThemes word:@"Soup" tags:@"FOOD", nil];
    [self addThemeTo:allThemes word:@"Cake" tags:@"FOOD", nil];
    [self addThemeTo:allThemes word:@"Ice Cream" tags:@"FOOD", nil];
    [self addThemeTo:allThemes word:@"Lollipop" tags:@"FOOD", nil];
    [self addThemeTo:allThemes word:@"Sushi" tags:@"FOOD", nil];
    [self addThemeTo:allThemes word:@"Sandwich" tags:@"FOOD", nil];
    [self addThemeTo:allThemes word:@"Brunch" tags:@"FOOD", nil];
    
    // TRANSPORTATION
    [self addThemeTo:allThemes word:@"Train" tags:@"TRANSPORTATION", nil];
    [self addThemeTo:allThemes word:@"Car" tags:@"TRANSPORTATION", nil];
    [self addThemeTo:allThemes word:@"Plane" tags:@"TRANSPORTATION", nil];
    [self addThemeTo:allThemes word:@"Subway" tags:@"TRANSPORTATION", nil];
    [self addThemeTo:allThemes word:@"Bus" tags:@"TRANSPORTATION", nil];
    [self addThemeTo:allThemes word:@"Taxi" tags:@"TRANSPORTATION", nil];
    [self addThemeTo:allThemes word:@"Rickshaw" tags:@"TRANSPORTATION", nil];
    [self addThemeTo:allThemes word:@"Bike" tags:@"TRANSPORTATION", nil];
    [self addThemeTo:allThemes word:@"Motorcycle" tags:@"TRANSPORTATION", nil];
    [self addThemeTo:allThemes word:@"Blimp" tags:@"TRANSPORTATION", nil];
    [self addThemeTo:allThemes word:@"Jet Pack" tags:@"TRANSPORTATION", nil];
    [self addThemeTo:allThemes word:@"Truck" tags:@"TRANSPORTATION", nil];
    
    /////////
    
    // Serialze array of themes
    SBJSON *jsonParser = [[SBJSON alloc] init];
    NSString *json = [jsonParser stringWithObject:allThemes error:nil];
    
    // Form file path
    NSString * resourcePath = [[NSBundle mainBundle] resourcePath];
    NSString *fileUrl = [resourcePath stringByAppendingPathComponent:@"themes.json"];
    
    // Write serialized message to file
    [json writeToFile:fileUrl atomically:YES encoding:NSUTF8StringEncoding error:nil];
}

@end
