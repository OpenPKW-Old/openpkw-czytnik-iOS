//
//  ProtocolFillingValidator.m
//  OpenPKW
//
//  Created by Lukasz Stocki on 23.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "ProtocolFillingValidator.h"

@implementation ProtocolFillingValidatorResult

@end

@implementation ProtocolFillingValidator

- (ProtocolFillingValidatorResult *)validateProtocol:(ProtocolForCommissionRequestDto *)protocol {
    
    // starting as all fields are invalid
    ProtocolFillingResult validationResult = (~ProtocolFillingResultValid);
    ProtocolFillingResultWarning warningResult = (~ProtocolFillingResultWarningNoWarnings);
    
    if (protocol != nil) {
        validationResult &= (~ProtocolFillingResultInvalidMissingProtocolDTO);
    }
    
    ProtocolFillingValidatorResult *result = [[ProtocolFillingValidatorResult alloc] init];
    result.hardValidation = validationResult;
    result.softValidation = warningResult;
    
    return result;
}

@end
