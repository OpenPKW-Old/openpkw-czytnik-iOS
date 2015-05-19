//
//  ElectoralCommisionAddViewController+Descriptors.h
//  OpenPKW
//
//  Created by Developer iOS on 18.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "ElectoralCommisionAddViewController.h"

extern NSString *const kCellReuseIdForElectoralCommisionEmTitle;
extern NSString *const kCellReuseIdForElectoralCommisionTitle;
extern NSString *const kCellReuseIdForElectoralCommisionInputCell;
extern NSString *const kCellReuseIdForElectoralCommisionImageHint;

@interface ElectoralCommisionAddViewController (Descriptors)

- (TableViewDescriptor *)setupTableDescriptor;

@end
