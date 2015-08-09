//
//  OpponentSelectTabelViewController.m
//  Final Project
//
//  Created by xy on 5/11/13.
//  Copyright (c) 2013 xy. All rights reserved.
//

#import "OpponentSelectTabelViewController.h"
#import "OpponentListModel.h"
#import "PlayerListModel.h"

@interface OpponentSelectTabelViewController ()

@end

@implementation OpponentSelectTabelViewController

- (void) viewDidAppear:(BOOL)animated
{
    [self.tableView reloadData];
}


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[OpponentListModel shareModel] numOfOpponents];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"opponentNameCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    OpponentModel * thisOpponent = [[OpponentListModel shareModel] opponentNumber:indexPath.row];
    cell.textLabel.text = thisOpponent.name;
    
    // Opponent "locked/unlocked" status comes from player model, not opponent model
    
    if ([[PlayerListModel shareModel].selectedPlayer.unlockedOpponents containsObject:[[OpponentListModel shareModel] opponentNumber:indexPath.row].name]) {
        cell.detailTextLabel.text = @"Unlocked";
    }
    else {
        cell.detailTextLabel.text = @"Locked";
    }
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  
    if ([[PlayerListModel shareModel].selectedPlayer.unlockedOpponents containsObject:[[OpponentListModel shareModel] opponentNumber:indexPath.row].name]) {
        [OpponentListModel shareModel].selectedOpponent = [[OpponentListModel shareModel] opponentNumber:indexPath.row];
        [self performSegueWithIdentifier:@"playGameSegue" sender:self];
    }
}

@end
