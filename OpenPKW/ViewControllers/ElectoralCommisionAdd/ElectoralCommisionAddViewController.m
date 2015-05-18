//
//  ElectoralCommisionAddViewController.m
//  OpenPKW
//
//  Created by Lukasz Stocki on 01.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "ElectoralCommisionAddViewController.h"

#import "BaseCell.h"
#import "ElectoralCommisionAddViewController+Descriptors.h"

@interface ElectoralCommisionAddViewController()

@property (nonatomic, strong) NSArray *rows;

@end

@implementation ElectoralCommisionAddViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.tableDescriptor = [self setupTableDescriptor];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [self.tableDescriptor countForSection:section];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	// get the cell
	NSString *cellReuseID = [self.tableDescriptor cellReuseIdForIndexPath:indexPath];
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseID];
	
	// configure the cell
	NSAssert([cell isKindOfClass:[BaseCell class]], @"Should be of BaseCell class");
	BaseCell *baseCell = (BaseCell *)cell;
	[baseCell configureCellWithRowDescriptor:[self.tableDescriptor rowDescriptorForIndexPath:indexPath]];
	
	return cell;
}

@end
