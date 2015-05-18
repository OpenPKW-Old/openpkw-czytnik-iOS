//
//  AbstractTableViewController.m
//  OpenPKW
//
//  Created by Piotr Tobolski on 25.04.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "AbstractTableViewController.h"

static CGFloat const kDefaultEstimatedRowHeight = 90;

@interface AbstractTableViewController ()

@end

@implementation AbstractTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = kDefaultEstimatedRowHeight;
}

@end
