//
//  BaseCell.m
//  OpenPKW
//
//  Created by Lukasz Stocki on 01.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "BaseCell.h"

@implementation BaseCell

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_7_1) {
        
        // why: http://stackoverflow.com/questions/19132908/auto-layout-constraints-issue-on-ios7-in-uitableviewcell
        self.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        
    } else {
        // TODO: fix constraints on iOS 8.X ...
        // explenation: http://stackoverflow.com/a/25884832
    }

    return self;
}

- (void)configureCellWithRowDescriptor:(id)descriptor {
    [NSException raise:NSInternalInconsistencyException
                format:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)];
}

@end
