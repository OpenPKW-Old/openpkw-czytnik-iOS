//
//  RowDescriptor.h
//  OpenPKW
//
//  Created by Lukasz Stocki on 10.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RowDescriptor : NSObject

@property (nonatomic, copy) NSString *displayText;
@property (nonatomic, copy) NSString *secondaryText;
@property (nonatomic, copy) NSString *cellReuseID;

+ (instancetype)rowDescriptorWithDisplayText:(NSString *)displayText
                               secondaryText:(NSString *)secondaryText
                                 cellReuseID:(NSString *)cellreuseID;

+ (instancetype)rowDescriptorWithDisplayText:(NSString *)displayText
                                 cellReuseID:(NSString *)cellreuseID;

@end
