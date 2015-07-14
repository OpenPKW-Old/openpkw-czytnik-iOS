//
//  ElectoralCommisionAddViewController+TempHelpers.m
//  OpenPKW
//
//  Created by Developer iOS on 14.07.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "ElectoralCommisionAddViewController+TempHelpers.h"

#import "LongTitleInputCell.h"

@interface ElectoralCommisionAddViewController()

@property (nonatomic, strong) NSIndexPath *indexPathForInputField;

@end

@implementation ElectoralCommisionAddViewController (TempHelpers)

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	
	[self tempCode_enterValidTempTerytCode];
}

- (void)tempCode_enterValidTempTerytCode {
	LongTitleInputCell *cell = (id)[self.tableView cellForRowAtIndexPath:self.indexPathForInputField];
	cell.inputTextField.text = @"123456-12";
}

@end
