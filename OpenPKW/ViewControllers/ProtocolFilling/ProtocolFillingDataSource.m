//
//  ProtocolFillingDataSource.m
//  OpenPKW
//
//  Created by Lukasz Stocki on 10.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "ProtocolFillingDataSource.h"

@interface ProtocolFillingDataSource ()

@property (nonatomic, strong) TableViewDescriptor *tableDescriptor;

@end

@implementation ProtocolFillingDataSource

#pragma mark - LifeCycle

- (instancetype)initWithTableDescriptor:(TableViewDescriptor *)tableDescriptor {
    
    self = [super init];
    if (self == nil) {
        return nil;
    }
    
    return self;
}

#pragma mark - Public API

- (RowDescriptor *)rowDescriptorForIndexPath:(NSIndexPath *)indexPath {
    SectionDescriptor *section = self.tableDescriptor.sectionsDescriptors[indexPath.section];
    RowDescriptor *row = section.rowsDescriptors[indexPath.row];
    
    return row;
}

- (NSString *)cellReuseIdForIndexPath:(NSIndexPath *)indexPath {
    RowDescriptor *row = [self rowDescriptorForIndexPath:indexPath];
    
    return row.cellReuseID;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

@end
