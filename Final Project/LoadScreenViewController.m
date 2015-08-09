//
//  LoadScreenViewController.m
//  Final Project
//
//  Created by xy on 5/19/13.
//  Copyright (c) 2013 xy. All rights reserved.
//

#import "LoadScreenViewController.h"

@interface LoadScreenViewController ()

@end

@implementation LoadScreenViewController

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.backgroundImage;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.myScrollView.contentSize = self.backgroundImage.bounds.size;
    
    self.myScrollView.contentOffset = CGPointMake(0, 0);
    
    self.scrollRightInstruction.center = CGPointMake((150), (self.backgroundImage.bounds.size.height)-20);
    
    self.scrollUpInstruction.center = CGPointMake((self.backgroundImage.bounds.size.width)-150, (self.backgroundImage.bounds.size.height)-20);
    
    self.scrollLeftInstruction.center = CGPointMake((self.backgroundImage.bounds.size.width)-150, (20));
    
    self.pressToStartButton.center = CGPointMake((self.backgroundImage.bounds.size.width)/2, (20));

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
