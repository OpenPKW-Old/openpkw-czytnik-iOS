//
//  CommissionDto.h
//  OpenPKW
//
//  Created by Piotr Tobolski on 09.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CandidateResponseDto.h"

@interface CommissionResponseDto : NSObject

@property (strong, nonatomic) NSString *commissionPkwId;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *address;

@property (strong, nonatomic) NSString *parentCommissionPkwId;
@property (strong, nonatomic) NSString *parentCommissionName;

@property (strong, nonatomic) NSArray *candidateList; //CandidateResponseDto


- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
