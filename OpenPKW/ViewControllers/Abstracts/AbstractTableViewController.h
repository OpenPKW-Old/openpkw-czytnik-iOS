//
//  AbstractTableViewController.h
//  OpenPKW
//
//  Created by Piotr Tobolski on 25.04.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TableViewDescriptor.h"

@interface AbstractTableViewController : UITableViewController

@property (nonatomic, strong) TableViewDescriptor *tableDescriptor;

@end
