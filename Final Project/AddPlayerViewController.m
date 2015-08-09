//
//  AddPlayerViewController.m
//  Final Project
//
//  Created by xy on 5/6/13.
//  Copyright (c) 2013 xy. All rights reserved.
//

#import "AddPlayerViewController.h"
#import "PlayerListModel.h"

@interface AddPlayerViewController ()

@end

@implementation AddPlayerViewController

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    PlayerModel * addedPLayer = [[PlayerModel alloc] init];
    
    // Set Player Defaults
    addedPLayer.mainHand = [NSMutableArray array];
    [addedPLayer.mainHand addObject:@"Staff"];
    addedPLayer.armor = [NSMutableArray array];
    [addedPLayer.armor addObject:@"Cloth"];
    addedPLayer.offHand = [NSMutableArray array];
    [addedPLayer.offHand addObject:@"Empty"];
    addedPLayer.inventory = [NSMutableArray array];
    addedPLayer.name = textField.text;
    addedPLayer.health = 100;
    addedPLayer.damage = 0;
    addedPLayer.defense = 0;
    addedPLayer.speed = 0;
    addedPLayer.unlockedOpponents = [NSMutableArray array];
    [addedPLayer.unlockedOpponents addObject:@"Zombie"];
    [[PlayerListModel shareModel] addPlayer:addedPLayer];
    
    [self.navigationController popViewControllerAnimated:YES];
    
    return YES;
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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
