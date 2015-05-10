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

- (TableViewDescriptor *)setupTableDescriptor {
    TableViewDescriptor *tableDescriptor = [TableViewDescriptor tableViewDescriptor];
    
    [tableDescriptor addSectionDescriptor:[self basicInformationSection]];
    [tableDescriptor addSectionDescriptor:[self otherCommisonSection]];
    [tableDescriptor addSectionDescriptor:[self votesGeneralSection]];
    [tableDescriptor addSectionDescriptor:[self votesCandidatesSection]];
    
    return tableDescriptor;
}

- (SectionDescriptor *)basicInformationSection {
    SectionDescriptor *section = [SectionDescriptor sectionDescriptorWithTitle:nil];
    
    NSArray *rows = @[
                      [RowDescriptor rowDescriptorWithDisplayText:@"Obwodowa Komisja Wyborcz Nr:"
                                                      cellReuseID:@"BoldSingleLineCenterCell"],
                      
                      [RowDescriptor rowDescriptorWithDisplayText:@"Nr: 582"
                                                    secondaryText:@"146513-582"
                                                      cellReuseID:@"DoubleValueTextCell"],
                      
                      [RowDescriptor rowDescriptorWithDisplayText:@"Przedszkole nr 55"
                                                      cellReuseID:@"SingleLineCenterCell"],
                      
                      [RowDescriptor rowDescriptorWithDisplayText:@"ul. Jana Cybisa 1, 02-784 Warszawa"
                                                      cellReuseID:@"SingleLineCenterCell"]
                      
                      ];
    
    [section addRowsDescriptors:rows];
    
    return section;
}

- (SectionDescriptor *)otherCommisonSection {
    SectionDescriptor *section = [SectionDescriptor sectionDescriptorWithTitle:nil];
    
    return section;
}

- (SectionDescriptor *)votesGeneralSection {
    NSString *titleForSection = @"II.14. Kandydaci otrzymali głosów ważnych";
    SectionDescriptor *section = [SectionDescriptor sectionDescriptorWithTitle:titleForSection];
    
    return section;
}

- (SectionDescriptor *)votesCandidatesSection {
    SectionDescriptor *section = [SectionDescriptor sectionDescriptorWithTitle:nil];
    
    return section;
}

@end
