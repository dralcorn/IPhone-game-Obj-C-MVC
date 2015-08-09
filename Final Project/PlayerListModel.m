//
//  PlayerListModel.m
//  Final Project
//
//  Created by xy on 5/6/13.
//  Copyright (c) 2013 xy. All rights reserved.
//

#import "PlayerListModel.h"

@interface PlayerListModel ()

@property (strong, nonatomic) NSMutableArray * playerList;

@end

@implementation PlayerListModel

@synthesize selectedPlayer = _selectedPlayer;

- (PlayerListModel *)init
{
    self.playerList = [NSMutableArray array];
    return self;
}

- (int)numOfPlayers
{
    return self.playerList.count;
}

- (PlayerModel *)playerNumber:(int)index
{
    return [self.playerList objectAtIndex:index];
}

- (void)addPlayer:(PlayerModel *)playToAdd
{
    if (![self.playerList containsObject:playToAdd]) {
        [self.playerList addObject:playToAdd];
    }
}

+ (PlayerListModel *)shareModel
{
    static PlayerListModel * _model;
    if (!_model) {
        _model = [[PlayerListModel alloc] init];
    }
    return _model;
}

@end
