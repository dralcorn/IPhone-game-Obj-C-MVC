//
//  GameViewController.h
//  Final Project
//
//  Created by xy on 5/6/13.
//  Copyright (c) 2013 xy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayerListModel.h"
#import "OpponentListModel.h"


@interface GameViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *quadOne;

@property (weak, nonatomic) IBOutlet UILabel *quadTwo;

@property (weak, nonatomic) IBOutlet UILabel *quadThree;

@property (weak, nonatomic) IBOutlet UILabel *quadFour;

@property (weak, nonatomic) IBOutlet UIButton *startLabel;

@property (weak, nonatomic) IBOutlet UILabel *reportLabel;

@property (weak, nonatomic) IBOutlet UILabel *playerHealthLabel;

@property (weak, nonatomic) IBOutlet UISlider *playerHealthSlider;

@property (weak, nonatomic) IBOutlet UISlider *enemyHealthSlider;

@property (weak, nonatomic) IBOutlet UILabel *enemyHealthLabel;

@property (nonatomic) int movementCounter;

@property (strong, nonatomic) NSMutableArray *movementArray;

@property (nonatomic) double timeItTookToMakeAllFourMoves;

@property (weak, nonatomic) IBOutlet UILabel *actionLabel;

@end
