//
//  RowDescriptor.m
//  OpenPKW
//
//  Created by Lukasz Stocki on 10.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "RowDescriptor.h"

#import "Macros.h"

@implementation RowDescriptor

+ (instancetype)rowDescriptorWithDisplayText:(NSString *)displayText
                                 cellReuseID:(NSString *)cellreuseID {
    
    return [self rowDescriptorWithDisplayText:displayText
                                secondaryText:nil
                                  cellReuseID:cellreuseID];
}

+ (instancetype)rowDescriptorWithDisplayText:(NSString *)displayText
                                 cellReuseID:(NSString *)cellreuseID
                                keyboardType:(UIKeyboardType)keyboardType {
    
    return [[self alloc] initWithDisplayText:displayText
                               secondaryText:nil
                                 cellReuseID:cellreuseID
                                keyboardType:keyboardType];
}

+ (instancetype)rowDescriptorWithDisplayText:(NSString *)displayText
                               secondaryText:(NSString *)secondaryText
                                 cellReuseID:(NSString *)cellreuseID {
    
    return [[self alloc] initWithDisplayText:displayText
                               secondaryText:secondaryText
                                 cellReuseID:cellreuseID
                                keyboardType:UIKeyboardTypeDefault];
}


- (instancetype)initWithDisplayText:(NSString *)displayText
                      secondaryText:(NSString *)secondaryText
                        cellReuseID:(NSString *)cellreuseID
                       keyboardType:(UIKeyboardType)keyboardType {
    
    EARLY_EXIT_IF_SELF_IS_NIL
    
    _displayText = [displayText copy];
    _secondaryText = [secondaryText copy];
    _cellReuseID = [cellreuseID copy];
    _keyboardType = keyboardType;
    
    return self;
}

@end
