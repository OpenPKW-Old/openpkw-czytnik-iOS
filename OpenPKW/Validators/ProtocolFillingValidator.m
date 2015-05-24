//
//  ProtocolFillingValidator.m
//  OpenPKW
//
//  Created by Lukasz Stocki on 23.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "ProtocolFillingValidator.h"

@implementation ProtocolFillingValidator

- (ProtocolFillingResult)validateProtocol:(ProtocolForCommissionRequestDto *)protocol {
    
    // starting as all fields are invalid
    ProtocolFillingResult validationResult = ProtocolFillingResultValid;
    
    if (protocol == nil) {
        validationResult ^= ProtocolFillingResultInvalidMissingProtocolDTO;
    }
    
    if ([self hasValidNumberOfGivenVotingCardsForProtocol:protocol] == NO) {
        validationResult ^= ProtocolFillingResultInvalidVotingPeopleCount;
    }
    
    if ([self hasValidCardsValidCountForProtocol:protocol] == NO) {
        validationResult ^= ProtocolFillingResultInvalidCardsValidCount;
    }
    
    return validationResult;
}

- (BOOL)hasValidNumberOfGivenVotingCardsForProtocol:(ProtocolForCommissionRequestDto *)protocol {
    // P1 Liczba osób, którym wydano karty do głosowania (pkt. 4),
    // nie może być większa od liczby wyborców uprawnionych do głosowania (pkt. 1).
    
    return protocol.votingPeopleCount <= protocol.permittedPeopleCount;
}


- (BOOL)hasValidCardsValidCountForProtocol:(ProtocolForCommissionRequestDto *)protocol {
    // P2 Liczba kart wyjętych z urny (pkt. 9) musi być równa sumie liczby kart nieważnych (pkt. 10)
    // i liczby kart ważnych (pkt. 11).
    BOOL p2Valid = (protocol.cardsValidCount == (protocol.votesValidCount + protocol.votesInvalidCount));
    
    
    // P3 Liczba kart ważnych (pkt. 11) musi być równa sumie liczby głosów nieważnych (pkt. 12)
    // i liczby głosów ważnych oddanych na wszystkich kandydatów (pkt. 13)
    NSUInteger candidatesVotesCount = 0;
    for (NSNumber *votesForCandidate in protocol.votesForCandidate.allValues) {
        candidatesVotesCount += [votesForCandidate unsignedIntegerValue];
    }
    
    BOOL p3Valid = protocol.cardsValidCount == (protocol.votesInvalidCount + candidatesVotesCount);
    
 
    return p2Valid && p3Valid;
}

@end
