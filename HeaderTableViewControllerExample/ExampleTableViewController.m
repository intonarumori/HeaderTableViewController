//
//  ExampleTableViewController.m
//  HeaderTableViewControllerExample
//
//  Created by Daniel Langh on 15/04/15.
//  Copyright (c) 2015 rumori. All rights reserved.
//

#import "ExampleTableViewController.h"

#import "ImagesViewController.h"

@interface ExampleTableViewController ()

@end

@implementation ExampleTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.headerHeight = 200.0f;
    self.topViewController = [ImagesViewController new];
    
    /*
     // works with header too
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    headerView.backgroundColor = [UIColor redColor];
    self.tableView.tableHeaderView = headerView;
     */
}

#pragma mark -

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    cell.textLabel.text = @"test";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
