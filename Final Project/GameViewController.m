//
//  GameViewController.m
//  Final Project
//
//  Created by xy on 5/6/13.
//  Copyright (c) 2013 xy. All rights reserved.
//

#import "GameViewController.h"
#import "WeaponsAndItemsModel.h"

@interface GameViewController ()

@property (strong, nonatomic) WeaponsAndItemsModel * droppedItems;
@property (strong, nonatomic) NSTimer * actionLabelTimer;
@property (nonatomic) int yPositionOfActionLabel;

@end

@implementation GameViewController

@synthesize movementArray = _movementArray;
@synthesize movementCounter = _movementCounter;
@synthesize timeItTookToMakeAllFourMoves = _timeItTookToMakeAllFourMoves;

//===========================================================
// Tap Recognizer Methods
//===========================================================

- (void) quadOneWasTapped:(UITapGestureRecognizer *)recognizer
{
    [_movementArray addObject:@"quadOne was tapped"];
    _movementCounter++;
    [self recordAndJudgePlayerMovemnt];
}

- (void) quadTwoWasTapped:(UITapGestureRecognizer *)recognizer
{
    [_movementArray addObject:@"quadTwo was tapped"];
    _movementCounter++;
    [self recordAndJudgePlayerMovemnt];
}
 
- (void) quadThreeWasTapped:(UITapGestureRecognizer *)recognizer
{
    
    [_movementArray addObject:@"quadThree was tapped"];
    _movementCounter++;
    [self recordAndJudgePlayerMovemnt];
}

- (void) quadFourWasTapped:(UITapGestureRecognizer *)recognizer
{
    [_movementArray addObject:@"quadFour was tapped"];
    _movementCounter++;
    [self recordAndJudgePlayerMovemnt];
}

//===========================================================
// Swipe Left Recognizer Methods
//===========================================================

- (void) quadOneWasSwipedLeft:(UISwipeGestureRecognizer *)recognizer
{
    [_movementArray addObject:@"quadOne was swiped left"];
    _movementCounter++;
    [self recordAndJudgePlayerMovemnt];
}

- (void) quadTwoWasSwipedLeft:(UISwipeGestureRecognizer *)recognizer
{
    [_movementArray addObject:@"quadTwo was swiped left"];
    _movementCounter++;
    [self recordAndJudgePlayerMovemnt];
}

- (void) quadThreeWasSwipedLeft:(UISwipeGestureRecognizer *)recognizer
{
    [_movementArray addObject:@"quadThree was swiped left"];
    _movementCounter++;
    [self recordAndJudgePlayerMovemnt];
}

- (void) quadFourWasSwipedLeft:(UISwipeGestureRecognizer *)recognizer
{
    [_movementArray addObject:@"quadFour was swiped left"];
    _movementCounter++;
    [self recordAndJudgePlayerMovemnt];
}

//===========================================================
// Swipe Left Recognizer Methods
//===========================================================

- (void) quadOneWasSwipedRight:(UISwipeGestureRecognizer *)recognizer
{
    [_movementArray addObject:@"quadOne was swiped right"];
    _movementCounter++;
    [self recordAndJudgePlayerMovemnt];
}

- (void) quadTwoWasSwipedRight:(UISwipeGestureRecognizer *)recognizer
{
    [_movementArray addObject:@"quadTwo was swiped right"];
    _movementCounter++;
    [self recordAndJudgePlayerMovemnt];
}

- (void) quadThreeWasSwipedRight:(UISwipeGestureRecognizer *)recognizer
{
    [_movementArray addObject:@"quadThree was swiped right"];
    _movementCounter++;
    [self recordAndJudgePlayerMovemnt];
}

- (void) quadFourWasSwipedRight:(UISwipeGestureRecognizer *)recognizer
{
    [_movementArray addObject:@"quadFour was swiped right"];
    _movementCounter++;
    [self recordAndJudgePlayerMovemnt];
}

//===========================================================
// Swipe Up Recognizer Methods
//===========================================================

- (void) quadOneWasSwipedUp:(UISwipeGestureRecognizer *)recognizer
{
    [_movementArray addObject:@"quadOne was swiped up"];
    _movementCounter++;
    [self recordAndJudgePlayerMovemnt];
}

- (void) quadTwoWasSwipedUp:(UISwipeGestureRecognizer *)recognizer
{
    [_movementArray addObject:@"quadTwo was swiped up"];
    _movementCounter++;
    [self recordAndJudgePlayerMovemnt];
}

- (void) quadThreeWasSwipedUp:(UISwipeGestureRecognizer *)recognizer
{
    [_movementArray addObject:@"quadThree was swiped up"];
    _movementCounter++;
    [self recordAndJudgePlayerMovemnt];
}

- (void) quadFourWasSwipedUp:(UISwipeGestureRecognizer *)recognizer
{
    [_movementArray addObject:@"quadFour was swiped up"];
    _movementCounter++;
    [self recordAndJudgePlayerMovemnt];
}

//===========================================================
// Swipe Down Recognizer Methods
//===========================================================

- (void) quadOneWasSwipedDown:(UISwipeGestureRecognizer *)recognizer
{
    [_movementArray addObject:@"quadOne was swiped down"];
    _movementCounter++;
    [self recordAndJudgePlayerMovemnt];
}

- (void) quadTwoWasSwipedDown:(UISwipeGestureRecognizer *)recognizer
{
    [_movementArray addObject:@"quadTwo was swiped down"];
    _movementCounter++;
    [self recordAndJudgePlayerMovemnt];
}

- (void) quadThreeWasSwipedDown:(UISwipeGestureRecognizer *)recognizer
{
    [_movementArray addObject:@"quadThree was swiped down"];
    _movementCounter++;
    [self recordAndJudgePlayerMovemnt];
}

- (void) quadFourWasSwipedDown:(UISwipeGestureRecognizer *)recognizer
{
    [_movementArray addObject:@"quadFour was swiped down"];
    _movementCounter++;
    [self recordAndJudgePlayerMovemnt];
}

//===========================================================
// Start Match Method
//===========================================================

- (IBAction)startMatchButtonPressed:(UIButton *)sender
{
    self.startLabel.hidden = YES;
    self.quadOne.hidden = NO;
    self.quadTwo.hidden = NO;
    self.quadThree.hidden = NO;
    self.quadFour.hidden = NO;
    
    [self setRequiredCombatMovement];

}

//===========================================================
// Set Nature of Combat Method
//===========================================================

- (void)setRequiredCombatMovement
{
    
    int randomNum = arc4random_uniform(10);
    
    NSLog(@"Random Attack (if < 5) or Defend (else) Num: %i", randomNum);
    
    if (randomNum < 5) {
        // player attacks
        self.reportLabel.text = @"Attack!";
        [OpponentListModel shareModel].selectedOpponent.isAttacking = NO;
     
    }
    else {
        // opponent attacks
        self.reportLabel.text = @"Defend Yourself!";
         [OpponentListModel shareModel].selectedOpponent.isAttacking = YES;
    }
    
    // Move squares
    [self alterQuadrantPositions];
    
    // Update label text
    [self setQuadrantLabels];
    
    //Reset the players time interval, marking when their turn began
    _timeItTookToMakeAllFourMoves = [[NSDate date] timeIntervalSince1970];
    
}

//===========================================================
// Determine Next Step In Game Method
//===========================================================

- (void)determineNextStepInGame
{
    
    // NO ONE HAS WON OR LOST
    if ([PlayerListModel shareModel].selectedPlayer.health > 0 && [OpponentListModel shareModel].selectedOpponent.health >0) {
        [self setRequiredCombatMovement];
    }
    
    // THE PLAYER HAS LOST
    if ([PlayerListModel shareModel].selectedPlayer.health <= 0) {
        [self playerHasLost];
    }
    
    // THE PLAYER HAS WON
    if ([OpponentListModel shareModel].selectedOpponent.health <= 0) {
        [self playerHasWon];
    }
}

//===========================================================
// Player Has Won Method
//===========================================================

- (void)playerHasWon {
    
    [PlayerListModel shareModel].selectedPlayer.health = 100;
    
    [OpponentListModel shareModel].selectedOpponent.health = [OpponentListModel shareModel].selectedOpponent.fullHealth;
    
    self.reportLabel.text = @"You Win!";
    
    [self.actionLabelTimer invalidate];
    
    self.actionLabel.text = @":)";
    
    self.actionLabel.alpha = 1;
    
    self.actionLabel.transform = CGAffineTransformMakeTranslation(0, 0);
    
    [UIView animateWithDuration:2 animations:^{
        self.actionLabel.transform = CGAffineTransformMakeTranslation(0, 200);
    }];
    
    self.enemyHealthLabel.text = @"Enemy Health: 0";
    
    self.quadOne.hidden = YES;
    
    self.quadTwo.hidden = YES;
    
    self.quadThree.hidden = YES;
    
    self.quadFour.hidden = YES;
    
    // UNLOCK NEXT PLAYER
    if (![[PlayerListModel shareModel].selectedPlayer.unlockedOpponents containsObject:[OpponentListModel shareModel].selectedOpponent.unlockableOpponent]) {
        [[PlayerListModel shareModel].selectedPlayer.unlockedOpponents addObject:[OpponentListModel shareModel].selectedOpponent.unlockableOpponent];
    }
    
    // ADD ARMOR SET TO INVENTORY
    if (![[PlayerListModel shareModel].selectedPlayer.armor containsObject:[[self.droppedItems.enemyDropSets objectForKey:[OpponentListModel shareModel].selectedOpponent.name] objectAtIndex:0]]) {
         [[PlayerListModel shareModel].selectedPlayer.armor addObject:[[self.droppedItems.enemyDropSets objectForKey:[OpponentListModel shareModel].selectedOpponent.name] objectAtIndex:0]];
    }
    
    // ADD MAINHAND WEAPON TO INVENTORY
    if (![[PlayerListModel shareModel].selectedPlayer.mainHand containsObject:[[self.droppedItems.enemyDropSets objectForKey:[OpponentListModel shareModel].selectedOpponent.name] objectAtIndex:1]]) {
         [[PlayerListModel shareModel].selectedPlayer.mainHand addObject:[[self.droppedItems.enemyDropSets objectForKey:[OpponentListModel shareModel].selectedOpponent.name] objectAtIndex:1]];
    }

    // ADD OFFHAND WEAPON TO INVENTORY
    if (![[PlayerListModel shareModel].selectedPlayer.offHand containsObject:[[self.droppedItems.enemyDropSets objectForKey:[OpponentListModel shareModel].selectedOpponent.name] objectAtIndex:2]]) {
        [[PlayerListModel shareModel].selectedPlayer.offHand addObject:[[self.droppedItems.enemyDropSets objectForKey:[OpponentListModel shareModel].selectedOpponent.name] objectAtIndex:2]];
    }
    
}

//===========================================================
// Player Has Lost Method
//===========================================================

- (void)playerHasLost {
    
    [PlayerListModel shareModel].selectedPlayer.health = 100;
    
    [OpponentListModel shareModel].selectedOpponent.health = [OpponentListModel shareModel].selectedOpponent.fullHealth;
    
    self.reportLabel.text = @"You Lose!";
    
    [self.actionLabelTimer invalidate];
    
    self.actionLabel.text = @":(";
    
    self.actionLabel.alpha = 1;
    
    self.actionLabel.transform = CGAffineTransformMakeTranslation(0, 0);
    
    [UIView animateWithDuration:2 animations:^{
        self.actionLabel.transform = CGAffineTransformMakeTranslation(0, 200);
    }];
    self.playerHealthLabel.text = @"Player Health: 0";
    
    self.quadOne.hidden = YES;
    
    self.quadTwo.hidden = YES;
    
    self.quadThree.hidden = YES;
    
    self.quadFour.hidden = YES;
}

//=============================================================================================
// Determine How Much Damage Was Taken/Done and Subtract From Player/Opponent Accordingly
//=============================================================================================

- (void)determineDamageDone
{
    
    if ([OpponentListModel shareModel].selectedOpponent.isAttacking == YES) {
        
        double totalDamageDeflected = 1;
        
        if ([[_movementArray objectAtIndex:0] isEqualToString:[[OpponentListModel shareModel].selectedOpponent.offensiveMovements objectAtIndex:0]]) {
            totalDamageDeflected = totalDamageDeflected + 1;
        }
        if ([[_movementArray objectAtIndex:1] isEqualToString:[[OpponentListModel shareModel].selectedOpponent.offensiveMovements objectAtIndex:1]]) {
            totalDamageDeflected = totalDamageDeflected + 1;
        }
        if ([[_movementArray objectAtIndex:2] isEqualToString:[[OpponentListModel shareModel].selectedOpponent.offensiveMovements objectAtIndex:2]]) {
            totalDamageDeflected = totalDamageDeflected + 1;
        }
        if ([[_movementArray objectAtIndex:3] isEqualToString:[[OpponentListModel shareModel].selectedOpponent.offensiveMovements objectAtIndex:3]]) {
            totalDamageDeflected = totalDamageDeflected + 1;
        }
        
        NSString * actionLableTextString = [NSString stringWithFormat:@"Damage Taken: %.2f", ([OpponentListModel shareModel].selectedOpponent.attack / totalDamageDeflected)];
        
        self.actionLabel.text = actionLableTextString;
        
        [PlayerListModel shareModel].selectedPlayer.health = [PlayerListModel shareModel].selectedPlayer.health - ([OpponentListModel shareModel].selectedOpponent.attack / totalDamageDeflected);
        
        double maxTimeForSpeedBonus = (.10 * [PlayerListModel shareModel].selectedPlayer.speed);
        
        if (_timeItTookToMakeAllFourMoves < maxTimeForSpeedBonus) {
            
            double lifeRestored = (.10 * [PlayerListModel shareModel].selectedPlayer.defense);
            
            if (totalDamageDeflected == 1) {
                lifeRestored = lifeRestored * 0.0;
            }
            else if (totalDamageDeflected == 2) {
                lifeRestored = lifeRestored * 1;
            }
            else if (totalDamageDeflected == 3) {
                lifeRestored = lifeRestored * 1.5;
            }
            else if (totalDamageDeflected == 4) {
                lifeRestored = lifeRestored * 2.0;
            }
            else {
                lifeRestored = lifeRestored * 2.5;
            }
            
            self.actionLabel.text = [actionLableTextString stringByAppendingFormat:@"\nSpeed Bonus - Life Restored: %.2f", lifeRestored];
            
            [PlayerListModel shareModel].selectedPlayer.health = [PlayerListModel shareModel].selectedPlayer.health + lifeRestored;
        }
    }
    else {
        
        double totalDamageGiven = 0.20;
        
        if ([[_movementArray objectAtIndex:0] isEqualToString:[[OpponentListModel shareModel].selectedOpponent.defensiveMovements objectAtIndex:0]]) {
            totalDamageGiven = totalDamageGiven + 0.20;
        }
        if ([[_movementArray objectAtIndex:1] isEqualToString:[[OpponentListModel shareModel].selectedOpponent.defensiveMovements objectAtIndex:1]]) {
            totalDamageGiven = totalDamageGiven + 0.20;
        }
        if ([[_movementArray objectAtIndex:2] isEqualToString:[[OpponentListModel shareModel].selectedOpponent.defensiveMovements objectAtIndex:2]]) {
            totalDamageGiven = totalDamageGiven + 0.20;
        }
        if ([[_movementArray objectAtIndex:3] isEqualToString:[[OpponentListModel shareModel].selectedOpponent.defensiveMovements objectAtIndex:3]]) {
            totalDamageGiven = totalDamageGiven + 0.20;
        }
        
        NSString * actionLableTextString = [NSString stringWithFormat:@"Damage Done: %.2f",([PlayerListModel shareModel].selectedPlayer.damage * totalDamageGiven)];
        
        self.actionLabel.text = actionLableTextString;
        
        [OpponentListModel shareModel].selectedOpponent.health = [OpponentListModel shareModel].selectedOpponent.health - ([PlayerListModel shareModel].selectedPlayer.damage * totalDamageGiven);
        
        double maxTimeForSpeedBonus = (.10 * [PlayerListModel shareModel].selectedPlayer.speed);
        
        if (_timeItTookToMakeAllFourMoves < maxTimeForSpeedBonus) {
            
            self.actionLabel.text = [actionLableTextString stringByAppendingFormat:@"\nSpeed Bonus - Damage Done: %.2f", (.10 * [PlayerListModel shareModel].selectedPlayer.damage) ];
            
            [OpponentListModel shareModel].selectedOpponent.health = [OpponentListModel shareModel].selectedOpponent.health - (.01 * [PlayerListModel shareModel].selectedPlayer.damage);
        }
    }
    
    self.yPositionOfActionLabel = 0;
    self.actionLabel.alpha = 1;
}

//===========================================================
// Record and Then Judge Player's Movements As Good or Bad Method
//===========================================================

- (void)recordAndJudgePlayerMovemnt
{
    // If player made the right move, make the label background blue; If not, make it red.
    NSString * manipulatedQuad = [[[_movementArray lastObject] componentsSeparatedByString:@" "] objectAtIndex:0];
    if ([manipulatedQuad isEqualToString:@"quadOne"]) {
        if ([OpponentListModel shareModel].selectedOpponent.isAttacking == YES) {
            if ([[_movementArray lastObject] isEqualToString:[[OpponentListModel shareModel].selectedOpponent.offensiveMovements objectAtIndex:_movementCounter-1]]) {
                self.quadOne.backgroundColor = [UIColor blueColor];
            }
            else {
                self.quadOne.backgroundColor = [UIColor redColor];
            }
        }
        else {
            if ([[_movementArray lastObject] isEqualToString:[[OpponentListModel shareModel].selectedOpponent.defensiveMovements objectAtIndex:_movementCounter-1]]) {
                self.quadOne.backgroundColor = [UIColor blueColor];
            }
            else {
                self.quadOne.backgroundColor = [UIColor redColor];
            }
        }
    }
    else if ([manipulatedQuad isEqualToString:@"quadTwo"]) {
        if ([OpponentListModel shareModel].selectedOpponent.isAttacking == YES) {
            if ([[_movementArray lastObject] isEqualToString:[[OpponentListModel shareModel].selectedOpponent.offensiveMovements objectAtIndex:_movementCounter-1]]) {
                self.quadTwo.backgroundColor = [UIColor blueColor];
            }
            else {
                self.quadTwo.backgroundColor = [UIColor redColor];
            }
        }
        else {
            if ([[_movementArray lastObject] isEqualToString:[[OpponentListModel shareModel].selectedOpponent.defensiveMovements objectAtIndex:_movementCounter-1]]) {
                self.quadTwo.backgroundColor = [UIColor blueColor];
            }
            else {
                self.quadTwo.backgroundColor = [UIColor redColor];
            }
        }
    }
    else if ([manipulatedQuad isEqualToString:@"quadThree"]) {
        if ([OpponentListModel shareModel].selectedOpponent.isAttacking == YES) {
            if ([[_movementArray lastObject] isEqualToString:[[OpponentListModel shareModel].selectedOpponent.offensiveMovements objectAtIndex:_movementCounter-1]]) {
                self.quadThree.backgroundColor = [UIColor blueColor];
            }
            else {
                self.quadThree.backgroundColor = [UIColor redColor];
            }
        }
        else {
            if ([[_movementArray lastObject] isEqualToString:[[OpponentListModel shareModel].selectedOpponent.defensiveMovements objectAtIndex:_movementCounter-1]]) {
                self.quadThree.backgroundColor = [UIColor blueColor];
            }
            else {
                self.quadThree.backgroundColor = [UIColor redColor];
            }
        }
    }
    else {
        if ([OpponentListModel shareModel].selectedOpponent.isAttacking == YES) {
            if ([[_movementArray lastObject] isEqualToString:[[OpponentListModel shareModel].selectedOpponent.offensiveMovements objectAtIndex:_movementCounter-1]]) {
                self.quadFour.backgroundColor = [UIColor blueColor];
            }
            else {
                self.quadFour.backgroundColor = [UIColor redColor];
            }
        }
        else {
            if ([[_movementArray lastObject] isEqualToString:[[OpponentListModel shareModel].selectedOpponent.defensiveMovements objectAtIndex:_movementCounter-1]]) {
                self.quadFour.backgroundColor = [UIColor blueColor];
            }
            else {
                self.quadFour.backgroundColor = [UIColor redColor];
            }
        }
    }
    
    // After four move (one round)...
    if (_movementCounter == 4) {
        NSLog(@"4 movemnts:\n%@\n%@\n%@\n%@",
              [_movementArray objectAtIndex:0],
              [_movementArray objectAtIndex:1],
              [_movementArray objectAtIndex:2],
              [_movementArray objectAtIndex:3]);
        
        // Find the total time it took the player to make all four moves
        _timeItTookToMakeAllFourMoves = ([[NSDate date] timeIntervalSince1970] -_timeItTookToMakeAllFourMoves);
        
        // Determine amount of damage or defense done
        [self determineDamageDone];
       
        // Reset player move recorder
        [_movementArray removeAllObjects];
        
        // Reset player move counter
        _movementCounter = 0;
        
        // Reset lable background colors to grey
        [self performSelector:@selector(setQuardrantBackgroundColorsToDefault) withObject:nil afterDelay:0.25];
        
        // Update the player's health label to show how much damage may have been taken
        self.playerHealthLabel.text = [NSString stringWithFormat:@"Player Health: %.2f", [PlayerListModel shareModel].selectedPlayer.health];
        
        // Update the player's health slider.
        self.playerHealthSlider.value = [PlayerListModel shareModel].selectedPlayer.health;
        
        // Update the opponent's health label to show how much damage may have been done
        self.enemyHealthLabel.text = [NSString stringWithFormat:@"Enenmy Health: %.2f",[OpponentListModel shareModel].selectedOpponent.health];
        
        // Update the opponent's health slider.
        self.enemyHealthSlider.value = [OpponentListModel shareModel].selectedOpponent.health;
        
        // Determine if the game is over or if another round is necessary
        [self determineNextStepInGame];
    }
}

//===========================================================
// Set Quadrant Labels' Desired Movement Descriptions
//===========================================================

- (void)setQuadrantLabels
{
    
    if ([OpponentListModel shareModel].selectedOpponent.isAttacking == YES) {
        
        // Use offensive moves to set labels' text
        NSMutableArray * opponenetMoveArray = [OpponentListModel shareModel].selectedOpponent.offensiveMovements;
        
        // Set label text for quadOne
        NSString * opponentMoveNum1 = [opponenetMoveArray objectAtIndex:0];
        
        if ([opponentMoveNum1 isEqualToString:@"quadOne was tapped"]) {
            self.quadOne.text = @"1 T";
        }
        else if ([opponentMoveNum1 isEqualToString:@"quadOne was swiped left"]) {
            self.quadOne.text = @"1 L";
        }
        else if ([opponentMoveNum1 isEqualToString:@"quadOne was swiped right"]) {
            self.quadOne.text = @"1 R";
        }
        else if ([opponentMoveNum1 isEqualToString:@"quadOne was swiped up"]) {
            self.quadOne.text = @"1 U";
        }
        else if ([opponentMoveNum1 isEqualToString:@"quadOne was swiped down"]) {
            self.quadOne.text = @"1 D";
        }
        
        // Set label text for quadTwo
        NSString * opponentMoveNum2 = [opponenetMoveArray objectAtIndex:1];
        
        if ([opponentMoveNum2 isEqualToString:@"quadTwo was tapped"]) {
            self.quadTwo.text = @"2 T";
        }
        else if ([opponentMoveNum2 isEqualToString:@"quadTwo was swiped left"]) {
            self.quadTwo.text = @"2 L";
        }
        else if ([opponentMoveNum2 isEqualToString:@"quadTwo was swiped right"]) {
            self.quadTwo.text = @"2 R";
        }
        else if ([opponentMoveNum2 isEqualToString:@"quadTwo was swiped up"]) {
            self.quadTwo.text = @"2 U";
        }
        else if ([opponentMoveNum2 isEqualToString:@"quadTwo was swiped down"]) {
            self.quadTwo.text = @"2 D";
        }
        
        // Set label text for quadThree
        NSString * opponentMoveNum3 = [opponenetMoveArray objectAtIndex:2];
        
        if ([opponentMoveNum3 isEqualToString:@"quadThree was tapped"]) {
            self.quadThree.text = @"3 T";
        }
        else if ([opponentMoveNum3 isEqualToString:@"quadThree was swiped left"]) {
            self.quadThree.text = @"3 L";
        }
        else if ([opponentMoveNum3 isEqualToString:@"quadThree was swiped right"]) {
            self.quadThree.text = @"3 R";
        }
        else if ([opponentMoveNum3 isEqualToString:@"quadThree was swiped up"]) {
            self.quadThree.text = @"3 U";
        }
        else if ([opponentMoveNum3 isEqualToString:@"quadThree was swiped down"]) {
            self.quadThree.text = @"3 D";
        }
        
        // Set label text for quadFour
        NSString * opponentMoveNum4 = [opponenetMoveArray objectAtIndex:3];
        
        if ([opponentMoveNum4 isEqualToString:@"quadFour was tapped"]) {
            self.quadFour.text = @"4 T";
        }
        else if ([opponentMoveNum4 isEqualToString:@"quadFour was swiped left"]) {
            self.quadFour.text = @"4 L";
        }
        else if ([opponentMoveNum4 isEqualToString:@"quadFour was swiped right"]) {
            self.quadFour.text = @"4 R";
        }
        else if ([opponentMoveNum4 isEqualToString:@"quadFour was swiped up"]) {
            self.quadFour.text = @"4 U";
        }
        else if ([opponentMoveNum4 isEqualToString:@"quadFour was swiped down"]) {
            self.quadFour.text = @"4 D";
        }
    }
    else {
        
        // Use defensive moves to set labels' text 
        NSMutableArray * opponenetMoveArray = [OpponentListModel shareModel].selectedOpponent.defensiveMovements;
        
        // Set label text for quadOne
        NSString * opponentMoveNum1 = [opponenetMoveArray objectAtIndex:0];
        
        if ([opponentMoveNum1 isEqualToString:@"quadOne was tapped"]) {
            self.quadOne.text = @"1 T";
        }
        else if ([opponentMoveNum1 isEqualToString:@"quadOne was swiped left"]) {
            self.quadOne.text = @"1 L";
        }
        else if ([opponentMoveNum1 isEqualToString:@"quadOne was swiped right"]) {
            self.quadOne.text = @"1 R";
        }
        else if ([opponentMoveNum1 isEqualToString:@"quadOne was swiped up"]) {
            self.quadOne.text = @"1 U";
        }
        else if ([opponentMoveNum1 isEqualToString:@"quadOne was swiped down"]) {
            self.quadOne.text = @"1 D";
        }
        
        // Set label text for quadTwo
        NSString * opponentMoveNum2 = [opponenetMoveArray objectAtIndex:1];
        
        if ([opponentMoveNum2 isEqualToString:@"quadTwo was tapped"]) {
            self.quadTwo.text = @"2 T";
        }
        else if ([opponentMoveNum2 isEqualToString:@"quadTwo was swiped left"]) {
            self.quadTwo.text = @"2 L";
        }
        else if ([opponentMoveNum2 isEqualToString:@"quadTwo was swiped right"]) {
            self.quadTwo.text = @"2 R";
        }
        else if ([opponentMoveNum2 isEqualToString:@"quadTwo was swiped up"]) {
            self.quadTwo.text = @"2 U";
        }
        else if ([opponentMoveNum2 isEqualToString:@"quadTwo was swiped down"]) {
            self.quadTwo.text = @"2 D";
        }
        
        // Set label text for quadThree
        NSString * opponentMoveNum3 = [opponenetMoveArray objectAtIndex:2];
        
        if ([opponentMoveNum3 isEqualToString:@"quadThree was tapped"]) {
            self.quadThree.text = @"3 T";
        }
        else if ([opponentMoveNum3 isEqualToString:@"quadThree was swiped left"]) {
            self.quadThree.text = @"3 L";
        }
        else if ([opponentMoveNum3 isEqualToString:@"quadThree was swiped right"]) {
            self.quadThree.text = @"3 R";
        }
        else if ([opponentMoveNum3 isEqualToString:@"quadThree was swiped up"]) {
            self.quadThree.text = @"3 U";
        }
        else if ([opponentMoveNum3 isEqualToString:@"quadThree was swiped down"]) {
            self.quadThree.text = @"3 D";
        }
        
        // Set label text for quadFour
        NSString * opponentMoveNum4 = [opponenetMoveArray objectAtIndex:3];
        
        if ([opponentMoveNum4 isEqualToString:@"quadFour was tapped"]) {
            self.quadFour.text = @"4 T";
        }
        else if ([opponentMoveNum4 isEqualToString:@"quadFour was swiped left"]) {
            self.quadFour.text = @"4 L";
        }
        else if ([opponentMoveNum4 isEqualToString:@"quadFour was swiped right"]) {
            self.quadFour.text = @"4 R";
        }
        else if ([opponentMoveNum4 isEqualToString:@"quadFour was swiped up"]) {
            self.quadFour.text = @"4 U";
        }
        else if ([opponentMoveNum4 isEqualToString:@"quadFour was swiped down"]) {
            self.quadFour.text = @"4 D";
        }
    }
}

//===========================================================
// Move Quadrant Labels to Around Screen For Each Turn
//===========================================================

- (void)alterQuadrantPositions
{
    int randNum = arc4random_uniform(4);
    int randNum2 = arc4random_uniform(3);
    int randNum3 = arc4random_uniform(2);
    
    if (randNum == 0)
    {
        [UIView animateWithDuration:0.5 animations:^{
            self.quadOne.transform = CGAffineTransformMakeTranslation(0, 0);
        }];
        
        if (randNum2 == 0) {
            
            [UIView animateWithDuration:0.5 animations:^{
                self.quadTwo.transform = CGAffineTransformMakeTranslation(0, 0);
            }];
            
            if (randNum3 == 0) {
                
                [UIView animateWithDuration:0.5 animations:^{
                    self.quadThree.transform = CGAffineTransformMakeTranslation(0, 0);
                }];
                
                [UIView animateWithDuration:0.5 animations:^{
                    self.quadFour.transform = CGAffineTransformMakeTranslation(0, 0);
                }];
            }
            else {
                
                [UIView animateWithDuration:0.5 animations:^{
                    self.quadThree.transform = CGAffineTransformMakeTranslation(108, 0);
                }];
                
                [UIView animateWithDuration:0.5 animations:^{
                    self.quadFour.transform = CGAffineTransformMakeTranslation(-108, 0);
                }];
            }
        }
        else if (randNum2 == 1) {
            
            [UIView animateWithDuration:0.5 animations:^{
                self.quadTwo.transform = CGAffineTransformMakeTranslation(0, 108);
            }];
            
            if (randNum3 == 0) {
                
                [UIView animateWithDuration:0.5 animations:^{
                    self.quadThree.transform = CGAffineTransformMakeTranslation(0, 0);
                }];
                
                [UIView animateWithDuration:0.5 animations:^{
                    self.quadFour.transform = CGAffineTransformMakeTranslation(0, -108);
                }];
            }
            else {
                
                [UIView animateWithDuration:0.5 animations:^{
                    self.quadThree.transform = CGAffineTransformMakeTranslation(108, -108);
                }];
                
                [UIView animateWithDuration:0.5 animations:^{
                    self.quadFour.transform = CGAffineTransformMakeTranslation(-108, 0);
                }];
            }
        }
        else {
            
            [UIView animateWithDuration:0.5 animations:^{
                self.quadTwo.transform = CGAffineTransformMakeTranslation(-108, 108);
            }];
            
            if (randNum3 == 0) {
                
                [UIView animateWithDuration:0.5 animations:^{
                    self.quadThree.transform = CGAffineTransformMakeTranslation(108, -108);
                }];
                
                [UIView animateWithDuration:0.5 animations:^{
                    self.quadFour.transform = CGAffineTransformMakeTranslation(0, 0);
                }];
            }
            else {
                
                [UIView animateWithDuration:0.5 animations:^{
                    self.quadThree.transform = CGAffineTransformMakeTranslation(108, 0);
                }];
                
                [UIView animateWithDuration:0.5 animations:^{
                    self.quadFour.transform = CGAffineTransformMakeTranslation(0, -108);
                }];
            }
        }
    }
    else if (randNum == 1) {
        
        [UIView animateWithDuration:0.5 animations:^{
            self.quadOne.transform = CGAffineTransformMakeTranslation(108, 0);
        }];
        
        if (randNum2 == 0) {
            
            [UIView animateWithDuration:0.5 animations:^{
                self.quadTwo.transform = CGAffineTransformMakeTranslation(0, 108);
            }];
            
            if (randNum3 == 0) {
                
                [UIView animateWithDuration:0.5 animations:^{
                    self.quadThree.transform = CGAffineTransformMakeTranslation(0, -108);
                }];
                
                [UIView animateWithDuration:0.5 animations:^{
                    self.quadFour.transform = CGAffineTransformMakeTranslation(-108, 0);
                }];
            }
            else {
                
                [UIView animateWithDuration:0.5 animations:^{
                    self.quadThree.transform = CGAffineTransformMakeTranslation(0, 0);
                }];
                
                [UIView animateWithDuration:0.5 animations:^{
                    self.quadFour.transform = CGAffineTransformMakeTranslation(-108, -108);
                }];
            }
        }
        else if (randNum2 == 1) {
            
            [UIView animateWithDuration:0.5 animations:^{
                self.quadTwo.transform = CGAffineTransformMakeTranslation(-108, 108);
            }];
            
            if (randNum3 == 0) {
                
                [UIView animateWithDuration:0.5 animations:^{
                    self.quadThree.transform = CGAffineTransformMakeTranslation(0, -108);
                }];
                
                [UIView animateWithDuration:0.5 animations:^{
                    self.quadFour.transform = CGAffineTransformMakeTranslation(0, 0);
                }];
            }
            else {
                
                [UIView animateWithDuration:0.5 animations:^{
                    self.quadThree.transform = CGAffineTransformMakeTranslation(108, 0);
                }];
                
                [UIView animateWithDuration:0.5 animations:^{
                    self.quadFour.transform = CGAffineTransformMakeTranslation(-108, -108);
                }];
            }
        }
        else {
            
            [UIView animateWithDuration:0.5 animations:^{
                self.quadTwo.transform = CGAffineTransformMakeTranslation(-108, 0);
            }];
            
            if (randNum3 == 0) {
                
                [UIView animateWithDuration:0.5 animations:^{
                    self.quadThree.transform = CGAffineTransformMakeTranslation(0, 0);
                }];
                
                [UIView animateWithDuration:0.5 animations:^{
                    self.quadFour.transform = CGAffineTransformMakeTranslation(0, 0);
                }];
            }
            else {
                
                [UIView animateWithDuration:0.5 animations:^{
                    self.quadThree.transform = CGAffineTransformMakeTranslation(108, 0);
                }];
                
                [UIView animateWithDuration:0.5 animations:^{
                    self.quadFour.transform = CGAffineTransformMakeTranslation(-108, 0);
                }];
            }
        }
    }
    else if (randNum == 2) {
        
        [UIView animateWithDuration:0.5 animations:^{
            self.quadOne.transform = CGAffineTransformMakeTranslation(108, 108);
        }];
        
        if (randNum2 == 0) {
            
            [UIView animateWithDuration:0.5 animations:^{
                self.quadTwo.transform = CGAffineTransformMakeTranslation(-108, 108);
            }];
            
            if (randNum3 == 0) {
                
                [UIView animateWithDuration:0.5 animations:^{
                    self.quadThree.transform = CGAffineTransformMakeTranslation(0, -108);
                }];
                
                [UIView animateWithDuration:0.5 animations:^{
                    self.quadFour.transform = CGAffineTransformMakeTranslation(0, -108);
                }];
            }
            else {
                
                [UIView animateWithDuration:0.5 animations:^{
                    self.quadThree.transform = CGAffineTransformMakeTranslation(108, -108);
                }];
                
                [UIView animateWithDuration:0.5 animations:^{
                    self.quadFour.transform = CGAffineTransformMakeTranslation(-108, -108);
                }];
            }
        }
        else if (randNum2 == 1) {
            
            [UIView animateWithDuration:0.5 animations:^{
                self.quadTwo.transform = CGAffineTransformMakeTranslation(-108, 0);
            }];
            
            if (randNum3 == 0) {
                
                [UIView animateWithDuration:0.5 animations:^{
                    self.quadThree.transform = CGAffineTransformMakeTranslation(0, 0);
                }];
                
                [UIView animateWithDuration:0.5 animations:^{
                    self.quadFour.transform = CGAffineTransformMakeTranslation(0, -108);
                }];
            }
            else {
                
                [UIView animateWithDuration:0.5 animations:^{
                    self.quadThree.transform = CGAffineTransformMakeTranslation(108, -108);
                }];
                
                [UIView animateWithDuration:0.5 animations:^{
                    self.quadFour.transform = CGAffineTransformMakeTranslation(-108, 0);
                }];
            }
        }
        else {
            
            [UIView animateWithDuration:0.5 animations:^{
                self.quadTwo.transform = CGAffineTransformMakeTranslation(0, 0);
            }];
            
            if (randNum3 == 0) {
                
                [UIView animateWithDuration:0.5 animations:^{
                    self.quadThree.transform = CGAffineTransformMakeTranslation(0, -108);
                }];
                
                [UIView animateWithDuration:0.5 animations:^{
                    self.quadFour.transform = CGAffineTransformMakeTranslation(-108, 0);
                }];
                
            }
            else {
                
                [UIView animateWithDuration:0.5 animations:^{
                    self.quadThree.transform = CGAffineTransformMakeTranslation(0, 0);
                }];
                
                [UIView animateWithDuration:0.5 animations:^{
                    self.quadFour.transform = CGAffineTransformMakeTranslation(-108, -108);
                }];
            }
        }
    }
    else {
        [UIView animateWithDuration:0.5 animations:^{
            self.quadOne.transform = CGAffineTransformMakeTranslation(0, 108);
        }];
        
        if (randNum2 == 0) {
            
            [UIView animateWithDuration:0.5 animations:^{
                self.quadTwo.transform = CGAffineTransformMakeTranslation(-108, 0);
            }];
            
            if (randNum3 == 0) {
                
                [UIView animateWithDuration:0.5 animations:^{
                    self.quadThree.transform = CGAffineTransformMakeTranslation(108, -108);
                }];
                
                [UIView animateWithDuration:0.5 animations:^{
                    self.quadFour.transform = CGAffineTransformMakeTranslation(0, 0);
                }];
            }
            else {
                
                [UIView animateWithDuration:0.5 animations:^{
                    self.quadThree.transform = CGAffineTransformMakeTranslation(108, 0);
                }];
                
                [UIView animateWithDuration:0.5 animations:^{
                    self.quadFour.transform = CGAffineTransformMakeTranslation(0, -108);
                }];
            }
        }
        else if (randNum2 == 1) {
            
            [UIView animateWithDuration:0.5 animations:^{
                self.quadTwo.transform = CGAffineTransformMakeTranslation(0, 0);
            }];
            
            if (randNum3 == 0) {
                
                [UIView animateWithDuration:0.5 animations:^{
                    self.quadThree.transform = CGAffineTransformMakeTranslation(0, -108);
                }];
                
                [UIView animateWithDuration:0.5 animations:^{
                    self.quadFour.transform = CGAffineTransformMakeTranslation(0, 0);
                }];
            }
            else {
                
                [UIView animateWithDuration:0.5 animations:^{
                    self.quadThree.transform = CGAffineTransformMakeTranslation(108, 0);
                }];
                
                [UIView animateWithDuration:0.5 animations:^{
                    self.quadFour.transform = CGAffineTransformMakeTranslation(-108, -108);
                }];
            }
        }
        else {
            
            [UIView animateWithDuration:0.5 animations:^{
                self.quadTwo.transform = CGAffineTransformMakeTranslation(0, 108);
            }];
            
            if (randNum3 == 0) {
                
                [UIView animateWithDuration:0.5 animations:^{
                    self.quadThree.transform = CGAffineTransformMakeTranslation(0, -108);
                }];
                
                [UIView animateWithDuration:0.5 animations:^{
                    self.quadFour.transform = CGAffineTransformMakeTranslation(0, -108);
                }];
            }
            else {
                
                [UIView animateWithDuration:0.5 animations:^{
                    self.quadThree.transform = CGAffineTransformMakeTranslation(108, -108);
                }];
                
                [UIView animateWithDuration:0.5 animations:^{
                    self.quadFour.transform = CGAffineTransformMakeTranslation(-108, -108);
                }];
            }
        }
    }
}

//===========================================================
// Set Quadrant Labels' Background Colors to Default (Grey)
//===========================================================

- (void)setQuardrantBackgroundColorsToDefault
{
    self.quadOne.backgroundColor = [UIColor lightGrayColor];
    self.quadTwo.backgroundColor = [UIColor lightGrayColor];
    self.quadThree.backgroundColor = [UIColor lightGrayColor];
    self.quadFour.backgroundColor = [UIColor lightGrayColor];
}

//==================================================================
// Move and Fade Action Label (Used with NSTimer "actionLabelTimer")
//==================================================================

- (void)moveAndFadeActionLabel
{
    self.yPositionOfActionLabel += 1;
    self.actionLabel.alpha -= .01;
    self.actionLabel.transform = CGAffineTransformMakeTranslation(0, self.yPositionOfActionLabel);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.actionLabel.alpha = 0;
    
    self.actionLabelTimer = [NSTimer scheduledTimerWithTimeInterval:0.025 target:self selector:@selector(moveAndFadeActionLabel) userInfo:nil repeats:YES];
    
    self.enemyHealthLabel.text = [NSString stringWithFormat:@"Enemy Health: %.2f", [OpponentListModel shareModel].selectedOpponent.health];
    
    self.enemyHealthSlider.maximumValue = [OpponentListModel shareModel].selectedOpponent.health;
    
    self.enemyHealthSlider.value = [OpponentListModel shareModel].selectedOpponent.health;
    
    self.playerHealthLabel.text = [NSString stringWithFormat:@"Enemy Health: %.2f", [PlayerListModel shareModel].selectedPlayer.health];
    
    self.playerHealthSlider.maximumValue = [PlayerListModel shareModel].selectedPlayer.health;
    
    self.playerHealthSlider.value = [PlayerListModel shareModel].selectedPlayer.health;
    
    _droppedItems = [[WeaponsAndItemsModel alloc] init];
    
    _movementArray = [NSMutableArray array];
    
    _movementCounter = 0;
    
    self.startLabel.hidden = NO;
    
    self.quadOne.hidden = YES;
    
    self.quadTwo.hidden = YES;
    
    self.quadThree.hidden = YES;
    
    self.quadFour.hidden = YES;
    
    //===========================================================
    // Enable interaction with labels (i.e. quadrants 1-4)
    //===========================================================
    
    [self.quadOne setUserInteractionEnabled:YES];
    
    [self.quadTwo setUserInteractionEnabled:YES];
    
    [self.quadThree setUserInteractionEnabled:YES];
    
    [self.quadFour setUserInteractionEnabled:YES];
    
    //===========================================================
    // Enable Tap Recognizers
    //===========================================================
    
    UITapGestureRecognizer * tapOne;
    tapOne = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(quadOneWasTapped:)];
    
    UITapGestureRecognizer * tapTwo;
    tapTwo = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(quadTwoWasTapped:)];
    
    UITapGestureRecognizer * tapThree;
    tapThree = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(quadThreeWasTapped:)];
    
    UITapGestureRecognizer * tapFour;
    tapFour = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(quadFourWasTapped:)];
    
    [self.quadOne addGestureRecognizer:tapOne];
    
    [self.quadTwo addGestureRecognizer:tapTwo];
    
    [self.quadThree addGestureRecognizer:tapThree];
    
    [self.quadFour addGestureRecognizer:tapFour];
    
    //===========================================================
    // Enable Swiping Left Recognizers
    //===========================================================
    
    UISwipeGestureRecognizer * swipeOneLeft;
    swipeOneLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(quadOneWasSwipedLeft:)];
    
    swipeOneLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    
    [self.quadOne addGestureRecognizer:swipeOneLeft];
    
    UISwipeGestureRecognizer * swipeTwoLeft;
    swipeTwoLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(quadTwoWasSwipedLeft:)];
    
    swipeTwoLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    
    [self.quadTwo addGestureRecognizer:swipeTwoLeft];
    
    UISwipeGestureRecognizer * swipeThreeLeft;
    swipeThreeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(quadThreeWasSwipedLeft:)];
    
    swipeThreeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    
    [self.quadThree addGestureRecognizer:swipeThreeLeft];
    
    UISwipeGestureRecognizer * swipeFourLeft;
    swipeFourLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(quadFourWasSwipedLeft:)];
    
    swipeFourLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    
    [self.quadFour addGestureRecognizer:swipeFourLeft];
    
    //===========================================================
    // Enable Swiping Right Recognizers
    //===========================================================
    
    UISwipeGestureRecognizer * swipeOneRight;
    swipeOneRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(quadOneWasSwipedRight:)];
    
    swipeOneRight.direction = UISwipeGestureRecognizerDirectionRight;
    
    [self.quadOne addGestureRecognizer:swipeOneRight];
    
    UISwipeGestureRecognizer * swipeTwoRight;
    swipeTwoRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(quadTwoWasSwipedRight:)];
    
    swipeTwoRight.direction = UISwipeGestureRecognizerDirectionRight;
    
    [self.quadTwo addGestureRecognizer:swipeTwoRight];
    
    UISwipeGestureRecognizer * swipeThreeRight;
    swipeThreeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(quadThreeWasSwipedRight:)];
    
    swipeThreeRight.direction = UISwipeGestureRecognizerDirectionRight;
    
    [self.quadThree addGestureRecognizer:swipeThreeRight];
    
    UISwipeGestureRecognizer * swipeFourRight;
    swipeFourRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(quadFourWasSwipedRight:)];
    
    swipeFourRight.direction = UISwipeGestureRecognizerDirectionRight;
    
    [self.quadFour addGestureRecognizer:swipeFourRight];
    
    //===========================================================
    // Enable Swiping Up Recognizers
    //===========================================================
    
    UISwipeGestureRecognizer * swipeOneUp;
    swipeOneUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(quadOneWasSwipedUp:)];
    
    swipeOneUp.direction = UISwipeGestureRecognizerDirectionUp;
    
    [self.quadOne addGestureRecognizer:swipeOneUp];
    
    UISwipeGestureRecognizer * swipeTwoUp;
    swipeTwoUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(quadTwoWasSwipedUp:)];
    
    swipeTwoUp.direction = UISwipeGestureRecognizerDirectionUp;
    
    [self.quadTwo addGestureRecognizer:swipeTwoUp];
    
    UISwipeGestureRecognizer * swipeThreeUp;
    swipeThreeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(quadThreeWasSwipedUp:)];
    
    swipeThreeUp.direction = UISwipeGestureRecognizerDirectionUp;
    
    [self.quadThree addGestureRecognizer:swipeThreeUp];
    
    UISwipeGestureRecognizer * swipeFourUp;
    swipeFourUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(quadFourWasSwipedUp:)];
    
    swipeFourUp.direction = UISwipeGestureRecognizerDirectionUp;
    
    [self.quadFour addGestureRecognizer:swipeFourUp];
    
    //===========================================================
    // Enable Swiping Down Recognizers
    //===========================================================
    
    UISwipeGestureRecognizer * swipeOneDown;
    swipeOneDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(quadOneWasSwipedDown:)];
    
    swipeOneDown.direction = UISwipeGestureRecognizerDirectionDown;
    
    [self.quadOne addGestureRecognizer:swipeOneDown];
    
    UISwipeGestureRecognizer * swipeTwoDown;
    swipeTwoDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(quadTwoWasSwipedDown:)];
    
    swipeTwoDown.direction = UISwipeGestureRecognizerDirectionDown;
    
    [self.quadTwo addGestureRecognizer:swipeTwoDown];
    
    UISwipeGestureRecognizer * swipeThreeDown;
    swipeThreeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(quadThreeWasSwipedDown:)];
    
    swipeThreeDown.direction = UISwipeGestureRecognizerDirectionDown;
    
    [self.quadThree addGestureRecognizer:swipeThreeDown];
    
    UISwipeGestureRecognizer * swipeFourDown;
    swipeFourDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(quadFourWasSwipedDown:)];
    
    swipeFourDown.direction = UISwipeGestureRecognizerDirectionDown;
    
    [self.quadFour addGestureRecognizer:swipeFourDown];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
