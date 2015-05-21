//
//  ElectoralCommisionAddViewController.m
//  OpenPKW
//
//  Created by Lukasz Stocki on 01.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "ElectoralCommisionAddViewController.h"
#import "ElectoralCommisionAddViewController+Descriptors.h"

#import "BaseCell.h"
#import "ButtonCell.h"
#import "LongTitleInputCell.h"

static NSString *const kSegueGoToProtocolFilling = @"ValidateElectoralCommision";

@interface ElectoralCommisionAddViewController() <ButtonCellInteractionDelegate, UITextFieldDelegate>

@property (nonatomic, strong) NSArray *rows;

@property (nonatomic, strong) NSIndexPath *indexPathForInputField;

@end

@implementation ElectoralCommisionAddViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.tableDescriptor = [self setupTableDescriptor];
	self.indexPathForInputField = [NSIndexPath indexPathForRow:2
													 inSection:0];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [self.tableDescriptor countForSection:section];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	// get the cell
	NSString *cellReuseID = [self.tableDescriptor cellReuseIdForIndexPath:indexPath];
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseID];
	
	[self configureCell:cell atIndexPath:indexPath];
	
	return cell;
}

#pragma mark - ButtonCell Interaction Delegate

- (void)userDidTapOnButtonCell:(ButtonCell *)buttonCell {
	[self performSegueWithIdentifier:kSegueGoToProtocolFilling
							  sender:self];
}

#pragma mark - UITextField Delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	[textField resignFirstResponder];
	
	return YES;
}

#pragma mark - Helper Methods

// TODO: think how to move the common stuff to the base class...
- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
	RowDescriptor *rowDescriptor = [self.tableDescriptor rowDescriptorForIndexPath:indexPath];
	
	if ([cell isKindOfClass:[BaseCell class]]) {
		[(BaseCell *)cell configureCellWithRowDescriptor:rowDescriptor];
		
		if ([cell isKindOfClass:[ButtonCell class]]) {
			ButtonCell *buttonCell = (ButtonCell *)cell;
			buttonCell.interactionDelegate = self;
		}
		else if ([cell isKindOfClass:[LongTitleInputCell class]]) {
			LongTitleInputCell *longTitleInputCell = (LongTitleInputCell *)cell;
			longTitleInputCell.inputTextField.delegate = self;
		}
	}
	else {
		cell.textLabel.text = rowDescriptor.displayText;
	}
}

@end
