//
//  SingleLabelCenterCell.m
//  OpenPKW
//
//  Created by Lukasz Stocki on 16.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "SingleLabelCenterCell.h"

@implementation SingleLabelCenterCell

- (void)configureCellWithRowDescriptor:(RowDescriptor *)descriptor {
    self.label.text = descriptor.displayText;
}

@end
