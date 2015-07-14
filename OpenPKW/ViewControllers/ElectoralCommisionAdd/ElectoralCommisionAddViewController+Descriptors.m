//
//  ElectoralCommisionAddViewController+Descriptors.m
//  OpenPKW
//
//  Created by Developer iOS on 18.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "ElectoralCommisionAddViewController+Descriptors.h"

#import "Strings+CommisionSelection.h"

NSString *const kCellReuseIdForElectoralCommisionEmTitle   = @"ElectoralCommissionEmTitle";
NSString *const kCellReuseIdForElectoralCommisionTitle     = @"ElectoralCommissionTitle";
NSString *const kCellReuseIdForElectoralCommisionInputCell = @"ElectoralCommissionInputCell";
NSString *const kCellReuseIdForElectoralCommisionImageHint = @"ElectoralCommisionImageHint";
NSString *const kCellReuseIdForElectoralCommisionButton    = @"ElectoralCommisionButton";


@implementation ElectoralCommisionAddViewController (Descriptors)

- (TableViewDescriptor *)setupTableDescriptor {
	TableViewDescriptor *tableDescriptor = [TableViewDescriptor tableViewDescriptor];
	
	[tableDescriptor addSectionDescriptor:[self setupCells]];
	
	return tableDescriptor;
}

- (SectionDescriptor *)setupCells {
	SectionDescriptor *section = [SectionDescriptor sectionDescriptorWithTitle:nil];
	
	NSArray *rows = @[
					  [RowDescriptor rowDescriptorWithDisplayText:[Strings electoralCommisionTitle]
													  cellReuseID:kCellReuseIdForElectoralCommisionTitle],
					  
					  [RowDescriptor rowDescriptorWithDisplayText:[Strings electoralCommisionTip]
													  cellReuseID:kCellReuseIdForElectoralCommisionEmTitle],
					  
					  [RowDescriptor rowDescriptorWithDisplayText:[Strings electoralCommisionQRButtonCTA]
													  cellReuseID:kCellReuseIdForElectoralCommisionButton],
					  
					  ({
						  RowDescriptor *row = [RowDescriptor rowDescriptorWithDisplayText:[Strings electoralCommisionInputTitle]
																			 secondaryText:[Strings electoralCommisionInputHint]
																			   cellReuseID:kCellReuseIdForElectoralCommisionInputCell];
						  row.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
						  row;
					  }),
					  
					  [RowDescriptor rowDescriptorWithDisplayText:nil
													  cellReuseID:kCellReuseIdForElectoralCommisionImageHint],
					  
					  [RowDescriptor rowDescriptorWithDisplayText:[Strings buttonCtaNext]
													  cellReuseID:kCellReuseIdForElectoralCommisionButton]
					  ];
	
	[section addRowsDescriptors:rows];
	
	return section;
}

@end
