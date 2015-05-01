//
//  VerticalTitleInputFieldCell.m
//  OpenPKW
//
//  Created by Lukasz Stocki on 01.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "VerticalTitleInputFieldCell.h"

@implementation VerticalTitleInputFieldCell

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    // why: http://stackoverflow.com/questions/19132908/auto-layout-constraints-issue-on-ios7-in-uitableviewcell
    self.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    return self;
}

- (void)configureCellWithRowDescriptor:(VerticalTitleInputFieldRowDescriptor *)descriptor {
    
    self.titleLabel.text = descriptor.title;
    self.inputTextField.placeholder = descriptor.inputPlaceholder;
}

@end
