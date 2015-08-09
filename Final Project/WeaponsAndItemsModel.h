//
//  WeaponsAndItemsModel.h
//  Final Project
//
//  Created by xy on 5/11/13.
//  Copyright (c) 2013 xy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeaponsAndItemsModel : NSObject

@property (strong, nonatomic) NSMutableArray * dropSetOne;
@property (strong, nonatomic) NSMutableArray * dropSetTwo;
@property (strong, nonatomic) NSMutableArray * dropSetThree;
@property (strong, nonatomic) NSMutableDictionary * enemyDropSets;
@property (strong, nonatomic) NSMutableDictionary * weaponStats;

@end
