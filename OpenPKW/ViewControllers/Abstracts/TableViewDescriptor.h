//
//  TableViewDescriptor.h
//  OpenPKW
//
//  Created by Lukasz Stocki on 10.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SectionDescriptor.h"

/**
 *  Class for describing tbale view sections and cells.
 */
@interface TableViewDescriptor : NSObject

/**
 *  Array of objects containg information about section.
 */
@property (nonatomic, readonly) NSArray *sectionsDescriptors;

+ (instancetype)tableViewDescriptor;

- (void)addSectionDescriptor:(SectionDescriptor *)sectionDescriptor;

@end
