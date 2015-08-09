//
//  PlayerModel.h
//  Final Project
//
//  Created by xy on 5/6/13.
//  Copyright (c) 2013 xy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OpponentListModel.h"

@interface PlayerModel : NSObject

@property (strong, nonatomic) NSString * name;
@property (strong, nonatomic) NSMutableArray * armor;
@property (strong, nonatomic) NSMutableArray * mainHand;
@property (strong, nonatomic) NSMutableArray * offHand;
@property (strong, nonatomic) NSMutableArray * inventory;
@property (strong, nonatomic) NSMutableArray * unlockedOpponents;
@property (nonatomic) double health;
@property (nonatomic) double damage;
@property (nonatomic) double defense;
@property (nonatomic) double speed;

@end
