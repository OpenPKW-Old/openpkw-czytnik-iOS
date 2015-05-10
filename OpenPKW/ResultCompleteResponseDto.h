//
//  ResultCompleteResponseDto.h
//  OpenPKW
//
//  Created by Piotr Tobolski on 10.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CandidateResponseDto.h"
#import "ResultCompleteParentCommissionResponseDto.h"

@interface ResultCompleteResponseDto : NSObject

@property (nonatomic) NSUInteger commissionsCount;
@property (nonatomic) NSUInteger commissionsCountMax;

@property (nonatomic) NSUInteger attendance;
@property (nonatomic) NSUInteger attendanceMax;

@property (strong, nonatomic) NSDate *exportDate;

@property (strong, nonatomic) NSArray *candidateList; //CandidateResponseDto
@property (strong, nonatomic) NSArray *parentCommissionList;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
