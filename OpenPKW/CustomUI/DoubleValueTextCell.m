//
//  DoubleValueTextCell.m
//  OpenPKW
//
//  Created by Lukasz Stocki on 16.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "DoubleValueTextCell.h"

@implementation DoubleValueTextCell

- (void)configureCellWithRowDescriptor:(RowDescriptor *)descriptor {
    self.leftLabel.text  = descriptor.displayText;
    self.rightLabel.text = descriptor.secondaryText;
}

@end
