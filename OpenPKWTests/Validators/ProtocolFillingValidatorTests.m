//
//  ProtocolFillingValidatorTests.m
//  OpenPKW
//
//  Created by Lukasz Stocki on 23.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import <Kiwi/Kiwi.h>

#import "ProtocolFillingValidator.h"

SPEC_BEGIN(ProtocolFillingValidatorTests)

ProtocolForCommissionRequestDto *(^correctProtocolDTO)() = ^{
    
    ProtocolForCommissionRequestDto *dto = [[ProtocolForCommissionRequestDto alloc] init];
    
    dto.permittedPeopleCount = 100; // how many people can vote
    dto.votingPeopleCount    = 50;  // how many people did vote
    
    dto.cardsValidCount   = 40; // valid cards
    dto.votesValidCount   = 30; // valid votes
    dto.votesInvalidCount = 10; // invalid votes
    
    return dto;
};

describe(@"ProtocolFillingValidatorTests", ^{
    
    __block ProtocolFillingValidator *systemUnderTest = nil;
    
    beforeEach(^{
        systemUnderTest = [[ProtocolFillingValidator alloc] init];
    });
    
    context(@"protocol dto presence", ^{
        context(@"missing", ^{
            it(@"should return a validation result containg missing protocol DTO", ^{
                
                ProtocolFillingValidatorResult *result = [systemUnderTest validateProtocol:nil];
                
                BOOL hasMissingDTOFSet = OptionsHasValue(result.hardValidation, ProtocolFillingResultInvalidMissingProtocolDTO);
                
                [[theValue(hasMissingDTOFSet) should] beYes];
            });
        });
        
        context(@"present", ^{
            it(@"should return a validation result containg missing protocol DTO", ^{
                
                ProtocolFillingValidatorResult *result = [systemUnderTest validateProtocol:[[ProtocolForCommissionRequestDto alloc] init]];
                
                BOOL hasMissingDTOFSet = OptionsHasValue(result.hardValidation, ProtocolFillingResultInvalidMissingProtocolDTO);
                
                [[theValue(hasMissingDTOFSet) should] beNo];
            });
        });
    });
    
    context(@"correct protocol dto", ^{
        it(@"should return a valid validation result", ^{
            
            ProtocolFillingValidatorResult *result = [systemUnderTest validateProtocol:correctProtocolDTO()];

            BOOL isValid = (result.hardValidation == ProtocolFillingResultValid);
            
            [[theValue(isValid) should] beYes];
        });
    });
    
});

SPEC_END
