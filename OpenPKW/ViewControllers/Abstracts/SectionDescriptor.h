//
//  SectionDescriptor.h
//  OpenPKW
//
//  Created by Lukasz Stocki on 10.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RowDescriptor.h"

@interface SectionDescriptor : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, readonly) NSArray *rowsDescriptors;

+ (instancetype)sectionDescriptorWithTitle:(NSString *)title;

- (void)addRowDescriptor:(RowDescriptor *)rowDescriptor;
- (void)addRowsDescriptors:(NSArray *)rowDescriptors;

@end
