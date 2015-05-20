//
//  ElectoralCommisionAddViewController+Descriptors.m
//  OpenPKW
//
//  Created by Developer iOS on 18.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "ElectoralCommisionAddViewController+Descriptors.h"

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
	
	[section addRowsDescriptors:@[
								  [RowDescriptor rowDescriptorWithDisplayText:@"Dodajesz Komisje z które będziesz przekazywać dane"
																  cellReuseID:kCellReuseIdForElectoralCommisionTitle],
								  [RowDescriptor rowDescriptorWithDisplayText:@"Wpisz, Kod Terytorialny Gminy w której znajduje się Twoja Komisja (znajdziesz go na protokole wyborczym)"
																  cellReuseID:kCellReuseIdForElectoralCommisionEmTitle],
								  
								  ({
									RowDescriptor *row = [RowDescriptor rowDescriptorWithDisplayText:@"Podaj Kod Terytorialny"
																					   secondaryText:@"xxxxxx-xxx"
																						 cellReuseID:kCellReuseIdForElectoralCommisionInputCell];
									row.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
									row;
								  }),
								  
								  [RowDescriptor rowDescriptorWithDisplayText:nil
																  cellReuseID:kCellReuseIdForElectoralCommisionImageHint],
								  
								  [RowDescriptor rowDescriptorWithDisplayText:@"Dalej"
																  cellReuseID:kCellReuseIdForElectoralCommisionButton]
								  ]];
	
	return section;
}

@end
