//
//  ProtocolFillingValidator.h
//  OpenPKW
//
//  Created by Lukasz Stocki on 23.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Macros.h"
#import "ProtocolForCommissionRequestDto.h"

typedef NS_ENUM(NSUInteger, ProtocolFillingResult) {
    ProtocolFillingResultValid                       = 0,
    ProtocolFillingResultInvalidCardsValidCount      = 1 << 0,
    ProtocolFillingResultInvalidVotingPeopleCount    = 1 << 1,
    ProtocolFillingResultInvalidMissingProtocolDTO   = 1 << 2
};

typedef NS_ENUM(NSUInteger, ProtocolFillingResultWarning) {
    ProtocolFillingResultWarningNoWarnings = 0
};

@interface ProtocolFillingValidatorResult : NSObject

@property (nonatomic, assign) ProtocolFillingResult hardValidation;
@property (nonatomic, assign) ProtocolFillingResultWarning softValidation;

@end

@interface ProtocolFillingValidator : NSObject

- (ProtocolFillingValidatorResult *)validateProtocol:(ProtocolForCommissionRequestDto *)protocol;

@end
