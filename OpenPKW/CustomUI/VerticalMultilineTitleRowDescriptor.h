//
//  VerticalMultilineTitleRowDescriptor.h
//  OpenPKW
//
//  Created by Lukasz Stocki on 01.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VerticalMultilineTitleRowDescriptor : NSObject

@property (nonatomic, copy) NSString *title;

+ (instancetype)rowDescriptorWithTitle:(NSString *)title;

@end
