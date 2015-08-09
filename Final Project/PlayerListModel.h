//
//  PlayerListModel.h
//  Final Project
//
//  Created by xy on 5/6/13.
//  Copyright (c) 2013 xy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlayerModel.h"

@interface PlayerListModel : NSObject

@property (strong, nonatomic) PlayerModel * selectedPlayer;

- (int)numOfPlayers;
- (PlayerModel *)playerNumber:(int)index;
- (void)addPlayer:(PlayerModel *)playToAdd;
+ (PlayerListModel *)shareModel;



@end
