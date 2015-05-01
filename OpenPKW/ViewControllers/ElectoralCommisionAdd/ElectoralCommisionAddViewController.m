//
//  ElectoralCommisionAddViewController.m
//  OpenPKW
//
//  Created by Lukasz Stocki on 01.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "ElectoralCommisionAddViewController.h"

#import "ElectoralCommisionAddViewController+SizingCellsHelperMethods.h"

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
                                                              inputPlaceholder:@"62-784"
                                                                  keyboardType:UIKeyboardTypeNumbersAndPunctuation],
                  
                  [VerticalTitleInputFieldRowDescriptor rowDescriptorWithTitle:@"Podaj Numer(y) Komisji Wyborczych:"
                                                              inputPlaceholder:@"13, 18, 26"
                                                                  keyboardType:UIKeyboardTypeNumbersAndPunctuation]];
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

@end
