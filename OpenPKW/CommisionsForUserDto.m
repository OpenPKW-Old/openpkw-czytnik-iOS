//
//  CommisionsForUserDto.m
//  OpenPKW
//
//  Created by Piotr Tobolski on 09.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "CommisionsForUserDto.h"

@implementation CommisionsForUserDto

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [self init]) {
        _commisionId = [dictionary[@"id"] stringValue];
        _commisionPkwId = dictionary[@"pkwId"];
        _name = dictionary[@"name"];
        _address = dictionary[@"address"];
        _protocolCount = [dictionary[@"protokolCount"] unsignedIntegerValue];
    }
    return self;
}

+ (NSArray *)objectWithResponseData:(NSArray *)responseData {
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:responseData.count];
    for (NSDictionary *dictionary in responseData) {
        CommisionsForUserDto *commisionsForUserDto = [[CommisionsForUserDto alloc] initWithDictionary:dictionary];
        [array addObject:commisionsForUserDto];
    }
    return array;
}

@end
