//
//  ButtonCell.m
//  OpenPKW
//
//  Created by Lukasz Stocki on 16.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "ButtonCell.h"

@implementation ButtonCell

- (void)awakeFromNib {
    [self.button addTarget:self
                    action:@selector(handleButtonTap)
          forControlEvents:UIControlEventTouchUpInside];
}

- (void)configureCellWithRowDescriptor:(RowDescriptor *)descriptor {
    [self.button setTitle:descriptor.displayText
                 forState:UIControlStateNormal];
}

- (void)handleButtonTap {
    [self.interactionDelegate userDidTapOnButtonCell:self];
}

- (void)prepareForReuse {
    self.interactionDelegate = nil;
}

@end
