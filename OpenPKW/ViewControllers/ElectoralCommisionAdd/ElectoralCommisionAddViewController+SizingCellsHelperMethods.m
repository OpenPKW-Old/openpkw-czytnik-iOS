//
//  ElectoralCommisionAddViewController+SizingCellsHelperMethods.m
//  OpenPKW
//
//  Created by Lukasz Stocki on 01.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "ElectoralCommisionAddViewController+SizingCellsHelperMethods.h"

@interface ElectoralCommisionAddViewController()

@property (nonatomic, strong) NSArray *rows;

- (NSString *)cellIdentifierForIndexPath:(NSIndexPath *)indexPath;

@end

@implementation ElectoralCommisionAddViewController (SizingCellsHelperMethods)

- (CGFloat)calculateHeightForConfiguredSizingCell:(UITableViewCell *)sizingCell {
    
    sizingCell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(self.tableView.frame), CGRectGetHeight(sizingCell.bounds));
    
    [sizingCell setNeedsLayout];
    [sizingCell layoutIfNeeded];
    
    CGSize size = [sizingCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    
    return size.height;
}

- (CGFloat)heightForCellAtIndexPath:(NSIndexPath *)indexPath{
    
    id rowDescriptorForPath = self.rows[indexPath.row];
    
    if ([rowDescriptorForPath isKindOfClass:[VerticalMultilineTitleRowDescriptor class]]) {
        return [self heightForVerticalMultilineTitleRowDescriptorAtIndexPath:indexPath];
    }
    
    if ([rowDescriptorForPath isKindOfClass:[VerticalTitleInputFieldRowDescriptor class]]) {
        return [self heightForVerticalTitleInputFieldCellAtIndexPath:indexPath];
    }
    
    return 100;
}

- (CGFloat)heightForVerticalMultilineTitleRowDescriptorAtIndexPath:(NSIndexPath *)indexPath {
    static VerticalMultilineTitleCell *sizingCell = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sizingCell = [self.tableView dequeueReusableCellWithIdentifier:[self cellIdentifierForIndexPath:indexPath]];
        NSAssert(sizingCell != nil, @"Cell shoud exist");
    });
    
    [sizingCell configureCellWithRowDescriptor:self.rows[indexPath.row]];
    
    return [self calculateHeightForConfiguredSizingCell:sizingCell];
}


- (CGFloat)heightForVerticalTitleInputFieldCellAtIndexPath:(NSIndexPath *)indexPath {
    static VerticalTitleInputFieldCell *sizingCell = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sizingCell = [self.tableView dequeueReusableCellWithIdentifier:[self cellIdentifierForIndexPath:indexPath]];
        NSAssert(sizingCell != nil, @"Cell shoud exist");
    });
    
    [sizingCell configureCellWithRowDescriptor:self.rows[indexPath.row]];
    
    return [self calculateHeightForConfiguredSizingCell:sizingCell];
}

@end
