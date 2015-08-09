//
//  LoadScreenViewController.h
//  Final Project
//
//  Created by xy on 5/19/13.
//  Copyright (c) 2013 xy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadScreenViewController : UIViewController <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *scrollDownInstruction;

@property (weak, nonatomic) IBOutlet UIButton *pressToStartButton;

@property (weak, nonatomic) IBOutlet UILabel *gameTitleLabel;

@property (weak, nonatomic) IBOutlet UILabel *scrollRightInstruction;

@property (weak, nonatomic) IBOutlet UILabel *scrollUpInstruction;

@property (weak, nonatomic) IBOutlet UILabel *scrollLeftInstruction;

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;

@property (weak, nonatomic) IBOutlet UIScrollView *myScrollView;


@end
