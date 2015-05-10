//
//  SectionDescriptor.m
//  OpenPKW
//
//  Created by Lukasz Stocki on 10.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "SectionDescriptor.h"

#import "Macros.h"

@interface SectionDescriptor ()

@property (nonatomic, strong) NSMutableArray *rows;

@end

@implementation SectionDescriptor

+ (instancetype)sectionDescriptorWithTitle:(NSString *)title {
    return [[self alloc] initWithTitle:title];
}

- (instancetype)initWithTitle:(NSString *)title {
    EARLY_EXIT_IF_SELF_IS_NIL
    
    _title = [title copy];
    _rows = [NSMutableArray array];
    
    return self;
}

#pragma mark - Public API

- (void)addRowDescriptor:(RowDescriptor *)rowDescriptor {
    NSAssert([rowDescriptor isKindOfClass:[RowDescriptor class]], @"Item should be of a RowDescriptor class");

    [self.rows addObject:rowDescriptor];
}

- (void)addRowsDescriptors:(NSArray *)rowDescriptors {
    for (id rowDescriptor in rowDescriptors) {
        [self addRowDescriptor:rowDescriptor];
    }
}

@end
