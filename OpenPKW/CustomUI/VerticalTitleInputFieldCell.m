//
//  VerticalTitleInputFieldCell.m
//  OpenPKW
//
//  Created by Lukasz Stocki on 01.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "VerticalTitleInputFieldCell.h"

@implementation VerticalTitleInputFieldCell

- (void)configureCellWithRowDescriptor:(VerticalTitleInputFieldRowDescriptor *)descriptor {
    
    self.titleLabel.text = descriptor.title;
    self.inputTextField.placeholder = descriptor.inputPlaceholder;
}

@end
