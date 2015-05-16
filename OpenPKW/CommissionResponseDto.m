//
//  CommissionDto.m
//  OpenPKW
//
//  Created by Piotr Tobolski on 09.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "CommissionResponseDto.h"

@implementation CommissionResponseDto

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [self init]) {
        _commissionPkwId = dictionary[@"pkwId"];
        _name = dictionary[@"name"];
        _address = dictionary[@"address"];
        _parentCommissionPkwId = dictionary[@"okregowa"][@"pkwId"];
        _parentCommissionName = dictionary[@"okregowa"][@"name"];
        _candidateList = [CandidateResponseDto objectWithResponseData:dictionary[@"kandydatList"]];
    }
    return self;
}


@end