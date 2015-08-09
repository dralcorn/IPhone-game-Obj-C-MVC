//
//  PlayerStatsAndOptionsViewController.h
//  Final Project
//
//  Created by xy on 5/6/13.
//  Copyright (c) 2013 xy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayerStatsAndOptionsViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UIPickerView *picker;

@property (weak, nonatomic) IBOutlet UITextView *inventoryTextView;

@property (weak, nonatomic) IBOutlet UITextView *statsTextView;

@property (weak, nonatomic) IBOutlet UILabel *locationLabel;

@end
