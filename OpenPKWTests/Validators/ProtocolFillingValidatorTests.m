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
    
    dto.votesForCandidate = @{ @"1": @20,
                               @"2": @10 };
    
    return dto;
};

ProtocolForCommissionRequestDto * (^invalidProtocolDTO)() = ^{
    ProtocolForCommissionRequestDto *dto = [[ProtocolForCommissionRequestDto alloc] init];
    
    dto.permittedPeopleCount = 100;  // how many people can vote
    dto.votingPeopleCount    = 150;  // how many people did vote
    
    dto.cardsValidCount   = 40; // valid cards
    dto.votesValidCount   = 30; // valid votes
    dto.votesInvalidCount = 10; // invalid votes
    
    dto.votesForCandidate = @{ @"1": @20,
                               @"2": @10 };
    
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
                
                ProtocolFillingResult result = [systemUnderTest validateProtocol:nil];
                
                BOOL hasMissingDTOFSet = OptionsHasValue(result, ProtocolFillingResultInvalidMissingProtocolDTO);
                
                [[theValue(hasMissingDTOFSet) should] beYes];
            });
        });
        
        context(@"present", ^{
            it(@"should return a validation result not containg missing protocol DTO", ^{
                
                ProtocolFillingResult result = [systemUnderTest validateProtocol:[[ProtocolForCommissionRequestDto alloc] init]];
                
                BOOL hasMissingDTOFSet = OptionsHasValue(result, ProtocolFillingResultInvalidMissingProtocolDTO);
                
                [[theValue(hasMissingDTOFSet) should] beNo];
            });
        });
    });
    
    context(@"voting people count", ^{
        context(@"is valid then", ^{
            it(@"should not contain invalid voting people count", ^{
                ProtocolFillingResult result = [systemUnderTest validateProtocol:correctProtocolDTO()];
                
                BOOL hasInvalidVotingPopleCount = OptionsHasValue(result, ProtocolFillingResultInvalidVotingPeopleCount);
                
                [[theValue(hasInvalidVotingPopleCount) should] beNo];
            });
        });
        
        context(@"is invalid then", ^{
            it(@"should contain invalid voting people count", ^{
                ProtocolFillingResult result = [systemUnderTest validateProtocol:invalidProtocolDTO()];
                
                BOOL hasInvalidVotingPopleCount = OptionsHasValue(result, ProtocolFillingResultInvalidVotingPeopleCount);
                
                [[theValue(hasInvalidVotingPopleCount) should] beYes];
            });
        });
    });
    
    context(@"cards valid count", ^{
        context(@"all fields are valid", ^{
            it(@"shoud not contain invalid cards count", ^{
                ProtocolFillingResult result = [systemUnderTest validateProtocol:correctProtocolDTO()];
                
                BOOL hasInvalidVotingPopleCount = OptionsHasValue(result, ProtocolFillingResultInvalidCardsValidCount);
                
                [[theValue(hasInvalidVotingPopleCount) should] beNo];
            });
        });
        
        context(@"votes valid count + votes invalid count is different than cards valid count", ^{
            it(@"shoud contain invalid cards count", ^{
                
                ProtocolForCommissionRequestDto *dataToTest = correctProtocolDTO();
                dataToTest.cardsValidCount = 100;
                dataToTest.votesValidCount = 200;
                dataToTest.votesInvalidCount = 100;
                
                ProtocolFillingResult result = [systemUnderTest validateProtocol:dataToTest];
                
                BOOL hasInvalidVotingPopleCount = OptionsHasValue(result, ProtocolFillingResultInvalidCardsValidCount);
                
                [[theValue(hasInvalidVotingPopleCount) should] beYes];
            });
        });
        
        context(@"votes invalid count + all candidate votes is differant than cards valid count", ^{
            ProtocolForCommissionRequestDto *dataToTest = correctProtocolDTO();
            dataToTest.cardsValidCount = 10;
            dataToTest.votesInvalidCount = 20;
            dataToTest.votesForCandidate = @{@"1": @50};
            
            ProtocolFillingResult result = [systemUnderTest validateProtocol:dataToTest];
            
            BOOL hasInvalidVotingPopleCount = OptionsHasValue(result, ProtocolFillingResultInvalidCardsValidCount);
            
            [[theValue(hasInvalidVotingPopleCount) should] beYes];
        });
        
        context(@"all validation rules are broaken", ^{
            ProtocolForCommissionRequestDto *dataToTest = correctProtocolDTO();
            dataToTest.cardsValidCount = 100;
            dataToTest.votesValidCount = 200;
            dataToTest.votesInvalidCount = 20;
            dataToTest.votesForCandidate = @{@"1": @550};
            
            ProtocolFillingResult result = [systemUnderTest validateProtocol:dataToTest];
            
            BOOL hasInvalidVotingPopleCount = OptionsHasValue(result, ProtocolFillingResultInvalidCardsValidCount);
            
            [[theValue(hasInvalidVotingPopleCount) should] beYes];
        });
    });
    
    context(@"correct protocol dto", ^{
        it(@"should return a valid validation result", ^{
            
            ProtocolFillingResult result = [systemUnderTest validateProtocol:correctProtocolDTO()];

            BOOL isValid = (result == ProtocolFillingResultValid);
            
            [[theValue(isValid) should] beYes];
        });
    });
    
});

SPEC_END
