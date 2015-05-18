//
//  VerticalMultilineTitleCell.m
//  OpenPKW
//
//  Created by Lukasz Stocki on 01.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "VerticalMultilineTitleCell.h"

@implementation VerticalMultilineTitleCell

- (void)configureCellWithRowDescriptor:(RowDescriptor *)descriptor {
	
    self.titleLabel.text = descriptor.displayText;
}

@end
