//
//  TableViewDescriptor.m
//  OpenPKW
//
//  Created by Lukasz Stocki on 10.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "TableViewDescriptor.h"

#import "Macros.h"

@interface TableViewDescriptor ()

@property (nonatomic, strong) NSMutableArray *sections;

@end

@implementation TableViewDescriptor

+ (instancetype)tableViewDescriptor {
    
    return [[self alloc] init];
}

- (instancetype)init {
    
    EARLY_EXIT_IF_SELF_IS_NIL
    
    _sections = [NSMutableArray array];
    
    return self;
}

#pragma mark - Public API

- (NSArray *)sectionsDescriptors {
    return [NSArray arrayWithArray:self.sections];
}

- (void)addSectionDescriptor:(SectionDescriptor *)sectionDescriptor {
    [self.sections addObject:sectionDescriptor];
}

#pragma mark - Table View Helpers

- (NSUInteger)countForSection:(NSInteger)sectionIndex {
	SectionDescriptor *sectionDescriptor = self.sections[sectionIndex];
	return [sectionDescriptor.rowsDescriptors count];
}

- (RowDescriptor *)rowDescriptorForIndexPath:(NSIndexPath *)indexPath {
	SectionDescriptor *section = self.sections[indexPath.section];
	RowDescriptor *row = section.rowsDescriptors[indexPath.row];
	
	return row;
}

- (NSString *)cellReuseIdForIndexPath:(NSIndexPath *)indexPath {
	RowDescriptor *row = [self rowDescriptorForIndexPath:indexPath];
	
	return row.cellReuseID;
}

@end
