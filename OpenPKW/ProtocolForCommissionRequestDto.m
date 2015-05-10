//
//  ProtocolForCommissionRequestDto.m
//  OpenPKW
//
//  Created by Piotr Tobolski on 10.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "ProtocolForCommissionRequestDto.h"

@implementation ProtocolForCommissionRequestDto

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *dictionaryRepresentation = [[NSMutableDictionary alloc] init];
    dictionaryRepresentation[@"kartWaznych"] = @(self.cardsValidCount);
    dictionaryRepresentation[@"glosowWaznych"] = @(self.votesValidCount);
    dictionaryRepresentation[@"glosowNieWaznych"] = @(self.votesInvalidCount);
    
    dictionaryRepresentation[@"uprawnionych"] = @(self.permittedPeopleCount);
    dictionaryRepresentation[@"glosujacych"] = @(self.votingPeopleCount);
    
    for (NSString *candidatePkwId in self.votesForCandidate.allKeys) {
        NSString *candidateKey = [NSString stringWithFormat:@"k%@", candidatePkwId];
        dictionaryRepresentation[candidateKey] = self.votesForCandidate[candidatePkwId];
    }
    
    return dictionaryRepresentation;
}

@end
