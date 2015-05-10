//
//  ResultCompleteParentCommissionResponseDto.m
//  OpenPKW
//
//  Created by Piotr Tobolski on 10.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "ResultCompleteParentCommissionResponseDto.h"

@implementation ResultCompleteParentCommissionResponseDto

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [self init]) {
        _name = dictionary[@"okregowaName"];
        _commissionsCount = [dictionary[@"obwodowa"] unsignedIntegerValue];
        _commissionsCountMax = [dictionary[@"obwodowaAll"] unsignedIntegerValue];
        _attendance = [dictionary[@"frekwencja"] unsignedIntegerValue];
        _attendanceMax = [dictionary[@"frekwencjaAll"] unsignedIntegerValue];
    }
    return self;
}

+ (NSArray *)objectWithResponseData:(NSArray *)responseData {
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:responseData.count];
    for (NSDictionary *dictionary in responseData) {
        ResultCompleteParentCommissionResponseDto *dto = [[ResultCompleteParentCommissionResponseDto alloc] initWithDictionary:dictionary];
        [array addObject:dto];
    }
    return array;
}

@end
