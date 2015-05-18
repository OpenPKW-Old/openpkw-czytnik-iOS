//
//  ProtocolFillingDataSource.h
//  OpenPKW
//
//  Created by Lukasz Stocki on 10.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

@import UIKit;

#import "TableViewDescriptor.h"

@interface ProtocolFillingDataSource : NSObject <UITableViewDataSource>

- (instancetype)initWithTableDescriptor:(TableViewDescriptor *)tableDescriptor;

- (RowDescriptor *)rowDescriptorForIndexPath:(NSIndexPath *)indexPath;
- (NSString *)cellReuseIdForIndexPath:(NSIndexPath *)indexPath;

@end
