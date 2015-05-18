//
//  ProtocolFillingDataSource.m
//  OpenPKW
//
//  Created by Lukasz Stocki on 10.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "ProtocolFillingDataSource.h"

#import "Macros.h"

@interface ProtocolFillingDataSource ()

@property (nonatomic, strong) TableViewDescriptor *tableDescriptor;

@end

@implementation ProtocolFillingDataSource

#pragma mark - LifeCycle

- (instancetype)initWithTableDescriptor:(TableViewDescriptor *)tableDescriptor {
    
    EARLY_EXIT_IF_SELF_IS_NIL
    
    self.tableDescriptor = tableDescriptor;
    
    return self;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    SectionDescriptor *sectionDescriptor = self.tableDescriptor.sectionsDescriptors[section];
    
    return [sectionDescriptor.rowsDescriptors count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellReuseID = [self.tableDescriptor cellReuseIdForIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseID];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.tableDescriptor.sectionsDescriptors count];
}

@end
