//
//  ResultCompleteResponseDto.m
//  OpenPKW
//
//  Created by Piotr Tobolski on 10.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "ResultCompleteResponseDto.h"

@implementation ResultCompleteResponseDto

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [self init]) {
        _commissionsCount = [dictionary[@"obwodowa"] unsignedIntegerValue];
        _commissionsCountMax = [dictionary[@"obwodowaAll"] unsignedIntegerValue];
        _attendance = [dictionary[@"frekwencja"] unsignedIntegerValue];
        _attendanceMax = [dictionary[@"frekwencjaAll"] unsignedIntegerValue];
        
        NSString *exportDate = dictionary[@"exportDate"];
        if (exportDate != nil) {
            _exportDate = [NSDate dateWithTimeIntervalSince1970:(exportDate.doubleValue / 1000.0)];
        }
        
        _candidateList = [CandidateResponseDto objectWithResponseData:dictionary[@"kandydatList"]];
        _parentCommissionList = [ResultCompleteParentCommissionResponseDto objectWithResponseData:dictionary[@"okregowaList"]];
    }
    return self;
}

@end
