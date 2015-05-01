//
//  ElectoralCommisionAddViewController.m
//  OpenPKW
//
//  Created by Lukasz Stocki on 01.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "ElectoralCommisionAddViewController.h"

#import "VerticalMultilineTitleCell.h"
#import "VerticalTitleInputFieldCell.h"

static NSString *const kElectoralCommissionInputCell = @"ElectoralCommissionInputCell";
static NSString *const kVerticalMultilineTitleCell   = @"VerticalMultilineTitleCell";

@interface ElectoralCommisionAddViewController()

@property (nonatomic, strong) NSArray *rows;

@end

@implementation ElectoralCommisionAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 90.0;
    
    [self setupRows];
}

#pragma mark - Setup

- (void)setupRows {
    self.rows = @[[VerticalMultilineTitleRowDescriptor rowDescriptorWithTitle:@"Wpisz, numer(y) komisji w Twojej Gminie,  z której chcesz przekazywać informacje."],
                  
                  [VerticalTitleInputFieldRowDescriptor rowDescriptorWithTitle:@"Podaj Kod Pocztowy:"
                                                              inputPlaceholder:@"62-784"],
                  
                  [VerticalTitleInputFieldRowDescriptor rowDescriptorWithTitle:@"Podaj Numer(y) Komisji Wyborczych:"
                                                              inputPlaceholder:@"13, 18, 26"]];
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = [self heightForCellAtIndexPath:indexPath];
    
    if (tableView.separatorStyle != UITableViewCellSeparatorStyleNone) {
        height += 1.0f;
    }
    
    return height;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.rows count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellIdentifier = [self cellIdentifierForIndexPath:indexPath];
    NSAssert(cellIdentifier != nil, @"Should have valid cell identifier.");
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier
                                                            forIndexPath:indexPath];
    
    BaseCell *inputCell = (BaseCell *)cell;
    
    [inputCell configureCellWithRowDescriptor:self.rows[indexPath.row]];
    
    return inputCell;
}

#pragma mark - Cells Identifiers

- (NSString *)cellIdentifierForIndexPath:(NSIndexPath *)indexPath {
    id rowDescriptorForPath = self.rows[indexPath.row];
    
    if ([rowDescriptorForPath isKindOfClass:[VerticalMultilineTitleRowDescriptor class]]) {
        return kVerticalMultilineTitleCell;
    }
    
    if ([rowDescriptorForPath isKindOfClass:[VerticalTitleInputFieldRowDescriptor class]]) {
        return kElectoralCommissionInputCell;
    }
    
    return nil;
}

#pragma mark - Sizing Cells Helper Methods

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
        sizingCell = [self.tableView dequeueReusableCellWithIdentifier:kVerticalMultilineTitleCell];
        NSAssert(sizingCell != nil, @"Cell shoud exist");
    });
    
    [sizingCell configureCellWithRowDescriptor:self.rows[indexPath.row]];
    
    return [self calculateHeightForConfiguredSizingCell:sizingCell];
}


- (CGFloat)heightForVerticalTitleInputFieldCellAtIndexPath:(NSIndexPath *)indexPath {
    static VerticalTitleInputFieldCell *sizingCell = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sizingCell = [self.tableView dequeueReusableCellWithIdentifier:kElectoralCommissionInputCell];
        NSAssert(sizingCell != nil, @"Cell shoud exist");
    });
    
    [sizingCell configureCellWithRowDescriptor:self.rows[indexPath.row]];
    
    return [self calculateHeightForConfiguredSizingCell:sizingCell];
}

@end
