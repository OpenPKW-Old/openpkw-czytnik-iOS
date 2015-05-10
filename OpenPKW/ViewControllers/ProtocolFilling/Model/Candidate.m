//
//  Candidate.m
//  OpenPKW
//
//  Created by Lukasz Stocki on 10.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "Candidate.h"

#import "Macros.h"

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

