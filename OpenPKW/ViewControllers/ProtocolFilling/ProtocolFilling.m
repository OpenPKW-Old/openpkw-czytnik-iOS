//
//  ProtocolFilling.m
//  OpenPKW
//
//  Created by Lukasz Stocki on 09.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "ProtocolFilling.h"

#import "ProtocolFillingDataSource.h"

@interface ProtocolFilling ()

@property (nonatomic, strong) ProtocolFillingDataSource *dataSource;

@end

@implementation ProtocolFilling

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSource = [[ProtocolFillingDataSource alloc] initWithTableDescriptor:[self setupTableDescriptor]];
}

#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

#pragma mark - UITableViewDataSource

#pragma mark - Helper Methods

@end
