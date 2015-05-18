//
//  BaseCell.h
//  OpenPKW
//
//  Created by Lukasz Stocki on 01.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RowDescriptor.h"

@interface BaseCell : UITableViewCell

- (void)configureCellWithRowDescriptor:(RowDescriptor *)descriptor;

@end
