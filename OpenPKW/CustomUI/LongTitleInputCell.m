//
//  LongTitleInputCell.m
//  OpenPKW
//
//  Created by Developer iOS on 19.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "LongTitleInputCell.h"

@implementation LongTitleInputCell

- (void)configureCellWithRowDescriptor:(RowDescriptor *)descriptor {
	
	self.label.text = descriptor.displayText;
	self.inputTextField.placeholder  = descriptor.secondaryText;
	self.inputTextField.keyboardType = descriptor.keyboardType;
}

- (void)prepareForReuse {
	self.inputTextField.delegate = nil;
	self.inputTextField.keyboardType = UIKeyboardTypeDefault;
}

@end
