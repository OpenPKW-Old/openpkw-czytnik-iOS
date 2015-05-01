//
//  VerticalTitleInputFieldRowDescriptor.m
//  OpenPKW
//
//  Created by Lukasz Stocki on 01.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "VerticalTitleInputFieldRowDescriptor.h"

@implementation VerticalTitleInputFieldRowDescriptor

+ (instancetype)rowDescriptorWithTitle:(NSString *)title
                      inputPlaceholder:(NSString *)inputPlaceholder {
    
    return [self rowDescriptorWithTitle:title
                       inputPlaceholder:inputPlaceholder
                           keyboardType:UIKeyboardTypeDefault];
}

+ (instancetype)rowDescriptorWithTitle:(NSString *)title
                      inputPlaceholder:(NSString *)inputPlaceholder
                          keyboardType:(UIKeyboardType)keyboardType {
    
    VerticalTitleInputFieldRowDescriptor *descriptor = [[self alloc] init];
    
    descriptor.title = title;
    descriptor.inputPlaceholder = inputPlaceholder;
    descriptor.keyboardType = keyboardType;
    
    return descriptor;
}

@end
