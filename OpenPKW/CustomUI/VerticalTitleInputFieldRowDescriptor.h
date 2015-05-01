//
//  VerticalTitleInputFieldRowDescriptor.h
//  OpenPKW
//
//  Created by Lukasz Stocki on 01.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

@import UIKit;

@interface VerticalTitleInputFieldRowDescriptor : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *inputPlaceholder;
@property (nonatomic, assign) UIKeyboardType keyboardType;

+ (instancetype)rowDescriptorWithTitle:(NSString *)title
                      inputPlaceholder:(NSString *)inputPlaceholder;

+ (instancetype)rowDescriptorWithTitle:(NSString *)title
                      inputPlaceholder:(NSString *)inputPlaceholder
                          keyboardType:(UIKeyboardType)keyboardType;

@end
