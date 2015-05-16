//
//  CandidateDto.m
//  OpenPKW
//
//  Created by Piotr Tobolski on 10.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "CandidateResponseDto.h"

@implementation CandidateResponseDto

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [self init]) {
        _pkwId = [dictionary[@"pkwId"] stringValue];
        _firstname = dictionary[@"firstname"];
        _lastname = dictionary[@"lastname"];
        _votesCount = [dictionary[@"glosow"] unsignedIntegerValue];
    }
    return self;
}

+ (NSArray *)objectWithResponseData:(NSArray *)responseData {
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:responseData.count];
    for (NSDictionary *dictionary in responseData) {
        CandidateResponseDto *candidateResponseDto = [[CandidateResponseDto alloc] initWithDictionary:dictionary];
        [array addObject:candidateResponseDto];
    }
    return array;
}

@end
