//
//  VerticalMultilineTitleRowDescriptor.m
//  OpenPKW
//
//  Created by Lukasz Stocki on 01.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "VerticalMultilineTitleRowDescriptor.h"

@implementation VerticalMultilineTitleRowDescriptor

+ (instancetype)rowDescriptorWithTitle:(NSString *)title {
    
    VerticalMultilineTitleRowDescriptor *descriptor = [[self alloc] init];
    
    descriptor.title = title;
    
    return descriptor;
}

@end
