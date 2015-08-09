//
//  OpponentListModel.h
//  Final Project
//
//  Created by xy on 5/11/13.
//  Copyright (c) 2013 xy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OpponentModel.h"

@interface OpponentListModel : NSObject

@property (strong, nonatomic) OpponentModel * selectedOpponent;

- (int)numOfOpponents;
- (OpponentModel *)opponentNumber:(int)index;
- (void)addOpponent:(OpponentModel *)opponentToAdd;
+ (OpponentListModel *)shareModel;

@end
