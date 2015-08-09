//
//  OpponentModel.h
//  Final Project
//
//  Created by xy on 5/11/13.
//  Copyright (c) 2013 xy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OpponentModel : NSObject

@property (strong, nonatomic) NSString * name;
@property (nonatomic) double attack;
@property (nonatomic) double defense;
@property (nonatomic) double health;
@property (nonatomic) double speed;
@property (strong, nonatomic) NSString * unlockableOpponent;
@property (nonatomic) BOOL isAttacking;
@property (strong, nonatomic) NSMutableArray * defensiveMovements;
@property (strong, nonatomic) NSMutableArray * offensiveMovements;
@property (nonatomic) double fullHealth;

@end
