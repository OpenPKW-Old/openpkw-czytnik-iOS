//
//  TableViewDescriptor.m
//  OpenPKW
//
//  Created by Lukasz Stocki on 10.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "TableViewDescriptor.h"

@interface TableViewDescriptor ()

@property (nonatomic, strong) NSMutableArray *sections;

@end

@implementation TableViewDescriptor

+ (instancetype)tableViewDescriptor {
    
    return [[self alloc] init];
}

- (instancetype)init {
    self = [super init];
    
    if (self == nil) {
        return nil;
    }
    
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


@end
