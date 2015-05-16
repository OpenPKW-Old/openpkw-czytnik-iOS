//
//  ProtocolForCommissionRequestDto.h
//  OpenPKW
//
//  Created by Piotr Tobolski on 10.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProtocolForCommissionRequestDto : NSObject

@property (nonatomic) NSUInteger cardsValidCount;
@property (nonatomic) NSUInteger votesValidCount;
@property (nonatomic) NSUInteger votesInvalidCount;

@property (nonatomic) NSUInteger permittedPeopleCount;
@property (nonatomic) NSUInteger votingPeopleCount;

@property (strong, nonatomic) NSDictionary *votesForCandidate; /// (NSString *pkwId): (NSNumber *votesCount)

- (NSDictionary *)dictionaryRepresentation;

@end
