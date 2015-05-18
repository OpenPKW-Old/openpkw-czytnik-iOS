//
//  VerticalTitleInputFieldCell.m
//  OpenPKW
//
//  Created by Lukasz Stocki on 01.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "VerticalTitleInputFieldCell.h"

@implementation VerticalTitleInputFieldCell

- (void)configureCellWithRowDescriptor:(RowDescriptor *)descriptor {
    
    self.titleLabel.text = descriptor.displayText;
    self.inputTextField.placeholder = descriptor.secondaryText;
    self.inputTextField.keyboardType = descriptor.keyboardType;
}

@end
