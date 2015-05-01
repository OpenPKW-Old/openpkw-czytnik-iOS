//
//  ElectoralCommisionAddViewController.m
//  OpenPKW
//
//  Created by Lukasz Stocki on 01.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "ElectoralCommisionAddViewController.h"

#import "VerticalTitleInputFieldCell.h"

static NSString *const kElectoralCommissionInputCell = @"ElectoralCommissionInputCell";

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
    self.rows = @[[VerticalTitleInputFieldRowDescriptor rowDescriptorWithTitle:@"Podaj Kod Pocztowy:"
                                                              inputPlaceholder:@"62-784"],
                  
                  [VerticalTitleInputFieldRowDescriptor rowDescriptorWithTitle:@"Podaj Numer(y) Komisji Wyborczych:"
                                                              inputPlaceholder:@"13, 18, 26"]];
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = [self heightForVerticalTitleInputFieldCellAtIndexPath:indexPath];
    
    if (tableView.separatorStyle != UITableViewCellSeparatorStyleNone) {
        height += 1.0f;
    }
    
    return height;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.rows count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kElectoralCommissionInputCell
                                                            forIndexPath:indexPath];
    
    VerticalTitleInputFieldCell *inputCell = (VerticalTitleInputFieldCell *)cell;
    
    [inputCell configureCellWithRowDescriptor:self.rows[indexPath.row]];
    
    return inputCell;
}

#pragma mark - Sizing Cells Helper Methods

- (CGFloat)calculateHeightForConfiguredSizingCell:(UITableViewCell *)sizingCell {
    
    sizingCell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(self.tableView.frame), CGRectGetHeight(sizingCell.bounds));
    
    [sizingCell setNeedsLayout];
    [sizingCell layoutIfNeeded];
    
    CGSize size = [sizingCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    
    return size.height;
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
