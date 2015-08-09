//
//  WeaponsAndItemsModel.m
//  Final Project
//
//  Created by xy on 5/11/13.
//  Copyright (c) 2013 xy. All rights reserved.
//

#import "WeaponsAndItemsModel.h"

@implementation WeaponsAndItemsModel

@synthesize dropSetOne = _dropSetOne;
@synthesize dropSetTwo = _dropSetTwo;
@synthesize dropSetThree = _dropSetThree;
@synthesize enemyDropSets = _enemyDropSets;
@synthesize weaponStats = _weaponStats;

- (WeaponsAndItemsModel *)init {
    
    // Object 1 = Armor; Object 2 = Mainhand Weapon; Object 3 = Offhand Weapon
    _dropSetOne = [NSMutableArray arrayWithObjects:@"Leather", @"Ax", @"Torch", nil];
    _dropSetTwo = [NSMutableArray arrayWithObjects:@"Mail", @"Sword", @"Shield", nil];
    _dropSetThree = [NSMutableArray arrayWithObjects:@"Plate", @"Mace", @"Mace",  nil];

    _enemyDropSets = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                      _dropSetOne, @"Zombie",
                      _dropSetTwo, @"Goblin",
                      _dropSetThree, @"Green Dragon",                      
                      nil];
    
    // Key = Item Name; Entry = Amounts added to player damage, defense, and speed 
    _weaponStats = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                    @"5 5 40", @"Cloth",
                    @"10 10 30", @"Leather",
                    @"20 20 20", @"Mail",
                    @"30 30 10", @"Plate",
                    @"5 5 40", @"Staff",
                    @"10 10 30", @"Ax",
                    @"20 20 20", @"Sword",
                    @"30 30 10", @"Mace",
                    @"0 0 40", @"Empty",
                    @"10 10 30", @"Torch",
                    @"20 20 20", @"Shield",
                    nil];
    
    return self;
}

@end
