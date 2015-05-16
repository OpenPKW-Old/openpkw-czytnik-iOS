//
//  ResultResponseDto.m
//  OpenPKW
//
//  Created by Piotr Tobolski on 10.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "ResultResponseDto.h"

@implementation ResultResponseDto

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [self init]) {
        _permittedPeopleCount = [dictionary[@"uprawnionych"] unsignedIntegerValue];
        _votingPeopleCount = [dictionary[@"glosujacych"] unsignedIntegerValue];
        _cardsValidCount = [dictionary[@"kartWaznych"] unsignedIntegerValue];
        _votesInvalidCount = [dictionary[@"glosowNieWaznych"] unsignedIntegerValue];
        _votesValidCount = [dictionary[@"glosowWaznych"] unsignedIntegerValue];
        
        NSUInteger candidateNumber = 1;
        NSMutableDictionary *votesForCandidate = [[NSMutableDictionary alloc] init];
        while (1) {
            NSString *candidatePkwId = @(candidateNumber).stringValue;
            NSString *candidateKey = [NSString stringWithFormat:@"k%@", candidatePkwId];
            NSNumber *votesCount = dictionary[candidateKey];
            if (votesCount != nil) {
                votesForCandidate[candidatePkwId] = votesCount;
            } else {
                break;
            }
            
            candidateNumber++;
        }
        _votesForCandidate = votesForCandidate;
        
        NSString *createdTimestamp = dictionary[@"timestampCreated"];
        if (createdTimestamp != nil) {
            _createdDate = [NSDate dateWithTimeIntervalSince1970:(createdTimestamp.doubleValue / 1000.0)];
        }
        
        _ratedPositive = [dictionary[@"ratedPositiv"] unsignedIntegerValue];
        _ratedNegative = [dictionary[@"ratedNegativ"] unsignedIntegerValue];
    }
    return self;
}

@end
