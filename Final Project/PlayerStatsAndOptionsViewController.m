//
//  PlayerStatsAndOptionsViewController.m
//  Final Project
//
//  Created by xy on 5/6/13.
//  Copyright (c) 2013 xy. All rights reserved.
//

#import "PlayerStatsAndOptionsViewController.h"
#import "PlayerListModel.h"
#import "WeaponsAndItemsModel.h"

@interface PlayerStatsAndOptionsViewController ()

@property (strong, nonatomic) WeaponsAndItemsModel * selectedItems;
@property (nonatomic) int armorDamage;
@property (nonatomic) int mainhandDamage;
@property (nonatomic) int offhandDamage;
@property (nonatomic) int armorDefense;
@property (nonatomic) int mainhandDefense;
@property (nonatomic) int offhandDefense;
@property (nonatomic) int armorSpeed;
@property (nonatomic) int mainhandSpeed;
@property (nonatomic) int offhandSpeed;

@end

@implementation PlayerStatsAndOptionsViewController

- (void)viewDidAppear:(BOOL)animated {
    [self.picker reloadAllComponents];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        return [[PlayerListModel shareModel].selectedPlayer.armor count];
    }
    else if (component == 1) {
        return [[PlayerListModel shareModel].selectedPlayer.mainHand count];
    }
    else {
        return [[PlayerListModel shareModel].selectedPlayer.offHand count];
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        return [[PlayerListModel shareModel].selectedPlayer.armor objectAtIndex:row];
    }
    else if (component == 1) {
        return [[PlayerListModel shareModel].selectedPlayer.mainHand objectAtIndex:row];
    }
    else {
        return [[PlayerListModel shareModel].selectedPlayer.offHand objectAtIndex:row];
    }
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
    
    self.nameLabel.text = [PlayerListModel shareModel].selectedPlayer.name;
    
    self.selectedItems = [[WeaponsAndItemsModel alloc]init];
    
    // Used for calculating player stats
    _armorDamage = 0;
    _mainhandDamage = 0;
    _offhandDamage = 0;
    _armorDefense = 0;
    _mainhandDefense = 0;
    _offhandDefense = 0;
    _armorSpeed = 0;
    _mainhandSpeed = 0;
    _offhandSpeed = 0;
    
    [self updateStatsTextView];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{

    
    
    if (component == 0)
    {
        // CALCULATE ARMOR STATS
        
        NSString * str1 = [[PlayerListModel shareModel].selectedPlayer.armor objectAtIndex:row];
        NSString * statNumString = [self.selectedItems.weaponStats objectForKey:str1];
                
        NSArray * statNumArray = [statNumString componentsSeparatedByString:@" "];
        
        _armorDamage = [[statNumArray objectAtIndex:0] integerValue];
        
        _armorDefense = [[statNumArray objectAtIndex:1] integerValue];
        
        _armorSpeed = [[statNumArray objectAtIndex:2] integerValue];
        
    }
    else if (component == 1)
    {
        // CALCULATE MAINHAND WEAPON STATS
        
        NSString * statNumString = [self.selectedItems.weaponStats objectForKey:[[PlayerListModel shareModel].selectedPlayer.mainHand objectAtIndex:row]];
        
        
        NSArray * statNumArray = [statNumString componentsSeparatedByString:@" "];
        
        _mainhandDamage = [[statNumArray objectAtIndex:0] integerValue];
        
        _mainhandDefense= [[statNumArray objectAtIndex:1] integerValue];
        
        _mainhandSpeed = [[statNumArray objectAtIndex:2] integerValue];
        
    }
    else
    {
        // CALCULATE OFFHAND WEAPONS STATS
        
        NSString * statNumString = [self.selectedItems.weaponStats objectForKey:[[PlayerListModel shareModel].selectedPlayer.offHand objectAtIndex:row]];
        
        
        NSArray * statNumArray = [statNumString componentsSeparatedByString:@" "];
        
        _offhandDamage = [[statNumArray objectAtIndex:0] integerValue];
        
        _offhandDefense = [[statNumArray objectAtIndex:1] integerValue];
        
        _offhandSpeed = [[statNumArray objectAtIndex:2] integerValue];
        
    }
    
    // Use selects armor, mainhand weapon, and offhand weapon stats to build player stats 
    
    [PlayerListModel shareModel].selectedPlayer.damage = (_armorDamage + _mainhandDamage +_offhandDamage);
    [PlayerListModel shareModel].selectedPlayer.defense = _armorDefense + _mainhandDefense + _offhandDefense;
    [PlayerListModel shareModel].selectedPlayer.speed = _armorSpeed + _mainhandSpeed + _offhandSpeed;
    
    [self updateStatsTextView];

}

- (void)updateStatsTextView
{
    // Display Updated Player Stats
    
    self.statsTextView.text = [NSString stringWithFormat:@"Health: %.0f\nDamage: %.0f\nDefense: %.0f\nSpeed: %.0f", [PlayerListModel shareModel].selectedPlayer.health, [PlayerListModel shareModel].selectedPlayer.damage, [PlayerListModel shareModel].selectedPlayer.defense, [PlayerListModel shareModel].selectedPlayer.speed];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
