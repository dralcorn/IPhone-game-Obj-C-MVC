//
//  OpponentListModel.m
//  Final Project
//
//  Created by xy on 5/11/13.
//  Copyright (c) 2013 xy. All rights reserved.
//

#import "OpponentListModel.h"

@interface OpponentListModel ()

@property (strong, nonatomic) NSMutableArray * opponentList;

@end

@implementation OpponentListModel

@synthesize selectedOpponent = _selectedOpponent;

- (OpponentListModel *)init
{
    self.opponentList = [NSMutableArray array];
    
    // Opponent 1: Zombie
    OpponentModel * zombie = [[OpponentModel alloc] init];
    zombie.name = @"Zombie";
    zombie.attack = 10;
    zombie.defense = 50;
    zombie.health = 50;
    zombie.fullHealth = 50;
    zombie.speed = 10;
    zombie.unlockableOpponent = @"Goblin";
    zombie.isAttacking = NO;
    zombie.defensiveMovements = [NSMutableArray arrayWithObjects:@"quadOne was tapped", @"quadTwo was swiped right" ,@"quadThree was swiped left" ,@"quadFour was swiped up", nil];
    zombie.offensiveMovements = [NSMutableArray arrayWithObjects:@"quadOne was swiped down", @"quadTwo was swiped up" ,@"quadThree was swiped right" ,@"quadFour was swiped left", nil];
    [_opponentList addObject:zombie];
    
    // Opponent 2: Goblin
    OpponentModel * goblin = [[OpponentModel alloc] init];
    goblin.name = @"Goblin";
    goblin.attack = 20;
    goblin.defense = 75;
    goblin.health = 75;
    goblin.fullHealth = 75;
    goblin.speed = 20;
    goblin.unlockableOpponent = @"Green Dragon";
    goblin.isAttacking = NO;
    goblin.defensiveMovements = [NSMutableArray arrayWithObjects:@"quadOne was swiped left", @"quadTwo was tapped" ,@"quadThree was swiped down" ,@"quadFour was swiped right", nil];
    goblin.offensiveMovements = [NSMutableArray arrayWithObjects:@"quadOne was swiped right", @"quadTwo was swiped down" ,@"quadThree was swiped up" ,@"quadFour was tapped", nil];
    [_opponentList addObject:goblin];
    
    
    // Opponent 3: Green Dragon
    OpponentModel * green_dragon = [[OpponentModel alloc] init];
    green_dragon.name = @"Green Dragon";
    green_dragon.attack = 30;
    green_dragon.defense = 100;
    green_dragon.health = 100;
    green_dragon.fullHealth = 100;
    green_dragon.speed = 30;
    green_dragon.unlockableOpponent = @"None for now";
    green_dragon.isAttacking = NO;
    green_dragon.defensiveMovements = [NSMutableArray arrayWithObjects:@"quadOne was swiped up", @"quadTwo was swiped down" ,@"quadThree was tapped" ,@"quadFour was swiped right", nil];
    green_dragon.offensiveMovements = [NSMutableArray arrayWithObjects:@"quadOne was swiped left", @"quadTwo was tapped" ,@"quadThree was swiped down" ,@"quadFour was swiped right", nil];
    [_opponentList addObject:green_dragon];    
    
    return self;
}

- (int)numOfOpponents
{
    return self.opponentList.count;
}

- (OpponentModel *)opponentNumber:(int)index
{
    return [self.opponentList objectAtIndex:index];
    
}

- (void) addOpponent:(OpponentModel *)opponentToAdd
{
    [self.opponentList addObject:opponentToAdd];
}

+ (OpponentListModel *)shareModel
{
    static OpponentListModel * _model;
    if (!_model) {
        _model = [[OpponentListModel alloc] init];
    }
    return _model;
}

@end
