//
//  ProtocolFilling+Descriptors.h
//  OpenPKW
//
//  Created by Lukasz Stocki on 10.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "ProtocolFilling.h"

#import "TableViewDescriptor.h"

extern NSString *const kCellReuseIdForBoldSingleLineCenterCell;
extern NSString *const kCellReuseIdForButtonCell;
extern NSString *const kCellReuseIdForCountedTitleInputCell;
extern NSString *const kCellReuseIdForDoubleValueTextCell;
extern NSString *const kCellReuseIdForSingleLineCenterCell;
extern NSString *const kCellReuseIdForTitleInputCell;

@interface ProtocolFilling (Descriptors)

- (TableViewDescriptor *)setupTableDescriptor;

@end
