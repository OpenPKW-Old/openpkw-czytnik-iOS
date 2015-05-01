//
//  ElectoralCommisionAddViewController+SizingCellsHelperMethods.h
//  OpenPKW
//
//  Created by Lukasz Stocki on 01.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "ElectoralCommisionAddViewController.h"

#import "VerticalMultilineTitleCell.h"
#import "VerticalTitleInputFieldCell.h"

@interface ElectoralCommisionAddViewController (SizingCellsHelperMethods)

- (CGFloat)calculateHeightForConfiguredSizingCell:(UITableViewCell *)sizingCell;

- (CGFloat)heightForCellAtIndexPath:(NSIndexPath *)indexPath;

- (CGFloat)heightForVerticalMultilineTitleRowDescriptorAtIndexPath:(NSIndexPath *)indexPath;

- (CGFloat)heightForVerticalTitleInputFieldCellAtIndexPath:(NSIndexPath *)indexPath;

@end
