//
//  RowDescriptor.m
//  OpenPKW
//
//  Created by Lukasz Stocki on 10.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "RowDescriptor.h"

@implementation RowDescriptor

+ (instancetype)rowDescriptorWithDisplayText:(NSString *)displayText
                                 cellReuseID:(NSString *)cellreuseID {
    
    return [self rowDescriptorWithDisplayText:displayText
                                secondaryText:nil
                                  cellReuseID:cellreuseID];
}
+ (instancetype)rowDescriptorWithDisplayText:(NSString *)displayText
                               secondaryText:(NSString *)secondaryText
                                 cellReuseID:(NSString *)cellreuseID {
    
    return [[self alloc] initWithDisplayText:displayText
                               secondaryText:secondaryText
                                 cellReuseID:cellreuseID];
}


- (instancetype)initWithDisplayText:(NSString *)displayText
                      secondaryText:(NSString *)secondaryText
                        cellReuseID:(NSString *)cellreuseID {
    self = [super init];
    
    if (self == nil) {
        return nil;
    }
    
    _displayText = [displayText copy];
    _secondaryText = [secondaryText copy];
    _cellReuseID = [cellreuseID copy];
    
    return self;
}

@end
