//
//  ProtocolFilling.m
//  OpenPKW
//
//  Created by Lukasz Stocki on 09.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "ProtocolFilling.h"

#import "Macros.h"
#import "ProtocolFillingDataSource.h"

static NSString *const kCellReuseIdForBoldSingleLineCenterCell = @"TempCell"; //@"BoldSingleLineCenterCell";
static NSString *const kCellReuseIdForButtonCell               = @"TempCell"; //@"ButtonCell";
static NSString *const kCellReuseIdForCountedTitleInputCell    = @"TempCell"; //@"CountedTitleInputCell";
static NSString *const kCellReuseIdForDoubleValueTextCell      = @"TempCell"; //@"DoubleValueTextCell";
static NSString *const kCellReuseIdForSingleLineCenterCell     = @"TempCell"; //@"SingleLineCenterCell";
static NSString *const kCellReuseIdForTitleInputCell           = @"TempCell"; //@"TitleInputCell";


////
// Temp Model For Candidates Data
@interface Candidate : NSObject

@property (nonatomic, copy) NSString *cadidateName;

+ (instancetype)cadidateWithName:(NSString *)name;

@end

@implementation Candidate

+ (instancetype)cadidateWithName:(NSString *)name {
    return [[self alloc] initWithName:name];
}

- (instancetype)initWithName:(NSString *)name {
    EARLY_EXIT_IF_SELF_IS_NIL
    
    _cadidateName = [name copy];
    
    return self;
}

@end

// end of temp model
////

@interface ProtocolFilling ()

@property (nonatomic, strong) ProtocolFillingDataSource *dataSource;

@end

@implementation ProtocolFilling

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSource = [[ProtocolFillingDataSource alloc] initWithTableDescriptor:[self setupTableDescriptor]];
    self.candidatesList = [self setupTempCandidateList];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataSource tableView:tableView numberOfRowsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.dataSource tableView:tableView cellForRowAtIndexPath:indexPath];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.dataSource numberOfSectionsInTableView:tableView];
}


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
                                                      cellReuseID:kCellReuseIdForBoldSingleLineCenterCell],
                      
                      [RowDescriptor rowDescriptorWithDisplayText:@"Nr: 582"
                                                    secondaryText:@"146513-582"
                                                      cellReuseID:kCellReuseIdForDoubleValueTextCell],
                      
                      [RowDescriptor rowDescriptorWithDisplayText:@"Przedszkole nr 55"
                                                      cellReuseID:kCellReuseIdForSingleLineCenterCell],
                      
                      [RowDescriptor rowDescriptorWithDisplayText:@"ul. Jana Cybisa 1, 02-784 Warszawa"
                                                      cellReuseID:kCellReuseIdForSingleLineCenterCell]
                      
                      ];
    
    [section addRowsDescriptors:rows];
    
    return section;
}

- (SectionDescriptor *)otherCommisonSection {
    SectionDescriptor *section = [SectionDescriptor sectionDescriptorWithTitle:nil];
    
    NSArray *rows = @[
                      [RowDescriptor rowDescriptorWithDisplayText:nil
                                                      cellReuseID:kCellReuseIdForButtonCell]
                      
                      ];
    
    [section addRowsDescriptors:rows];
    
    return section;
}

- (SectionDescriptor *)votesGeneralSection {
    SectionDescriptor *section = [SectionDescriptor sectionDescriptorWithTitle:nil];
    
    NSArray *rows = @[
                      [RowDescriptor rowDescriptorWithDisplayText:@"I.1.Uprawnionych do głosowania"
                                                      cellReuseID:kCellReuseIdForTitleInputCell],
                      
                      [RowDescriptor rowDescriptorWithDisplayText:@"I.4.Wydano kart do głosowania"
                                                      cellReuseID:kCellReuseIdForTitleInputCell],
                      
                      [RowDescriptor rowDescriptorWithDisplayText:@"II.11. Kart ważnych"
                                                      cellReuseID:kCellReuseIdForTitleInputCell],
                      
                      [RowDescriptor rowDescriptorWithDisplayText:@"II.12 Głosów nieważnych"
                                                      cellReuseID:kCellReuseIdForTitleInputCell],
                      
                      [RowDescriptor rowDescriptorWithDisplayText:@"II.13. Głosów ważnych"
                                                      cellReuseID:kCellReuseIdForTitleInputCell]
                      ];
    
    [section addRowsDescriptors:rows];
    
    return section;
}

- (SectionDescriptor *)votesCandidatesSection {
    NSString *titleForSection = @"II.14. Kandydaci otrzymali głosów ważnych";
    SectionDescriptor *section = [SectionDescriptor sectionDescriptorWithTitle:titleForSection];
    
    NSMutableArray *rows = [NSMutableArray arrayWithCapacity:self.candidatesList.count];
    
    for (Candidate *candidate in self.candidatesList) {
        [rows addObject:[RowDescriptor rowDescriptorWithDisplayText:candidate.cadidateName
                                                        cellReuseID:kCellReuseIdForCountedTitleInputCell]];
        
    }
    
    [section addRowsDescriptors:rows];
    
    return section;
}

#pragma mark - Temporary Model Data Methods

- (NSArray *)setupTempCandidateList {
    
    return @[ [Candidate cadidateWithName:@"Jan Kowalski"],
              [Candidate cadidateWithName:@"Sierotka Marysia"],
              [Candidate cadidateWithName:@"Kuba Maliniak"],
              [Candidate cadidateWithName:@"Macko z Bogdanca"],
              [Candidate cadidateWithName:@"Jurand"] ];
}

@end
