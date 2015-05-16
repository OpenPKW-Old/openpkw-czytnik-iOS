//
//  ResultResponseDto.h
//  OpenPKW
//
//  Created by Piotr Tobolski on 10.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResultResponseDto : NSObject

@property (nonatomic) NSUInteger cardsValidCount;
@property (nonatomic) NSUInteger votesValidCount;
@property (nonatomic) NSUInteger votesInvalidCount;

@property (nonatomic) NSUInteger permittedPeopleCount;
@property (nonatomic) NSUInteger votingPeopleCount;

/// (NSString *pkwId): (NSNumber *votesCount)
@property (strong, nonatomic) NSDictionary *votesForCandidate;

@property (strong, nonatomic) NSDate *createdDate;
@property (nonatomic) NSUInteger ratedPositive;
@property (nonatomic) NSUInteger ratedNegative;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
