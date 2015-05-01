//
//  VerticalTitleInputFieldCell.m
//  OpenPKW
//
//  Created by Lukasz Stocki on 01.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "VerticalTitleInputFieldCell.h"

@implementation VerticalTitleInputFieldCell

- (void)configureCellWithRowDescriptor:(id)descriptor {
    
    NSAssert([descriptor isKindOfClass:[VerticalTitleInputFieldRowDescriptor class]], @"Descriptor should be of VerticalTitleInputFieldRowDescriptor class");
    
    VerticalTitleInputFieldRowDescriptor *rowDescriptor = (VerticalTitleInputFieldRowDescriptor *)descriptor;
    
    self.titleLabel.text = rowDescriptor.title;
    self.inputTextField.placeholder = rowDescriptor.inputPlaceholder;
    self.inputTextField.keyboardType = rowDescriptor.keyboardType;
}

@end
