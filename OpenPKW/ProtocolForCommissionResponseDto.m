//
//  ProtocolForCommissionResponseDto.m
//  OpenPKW
//
//  Created by Piotr Tobolski on 10.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "ProtocolForCommissionResponseDto.h"

@implementation ProtocolForCommissionResponseDto

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [self init]) {
        _protocolId = [dictionary[@"id"] stringValue];
        
        NSString *uploadTimestamp = dictionary[@"uploadTimestamp"];
        if (uploadTimestamp != nil) {
            _uploadDate = [NSDate dateWithTimeIntervalSince1970:(uploadTimestamp.doubleValue / 1000.0)];
        }
        
        _ratedPositive = [dictionary[@"ratedPositiv"] unsignedIntegerValue];
        _ratedNegative = [dictionary[@"ratedNegativ"] unsignedIntegerValue];
    }
    return self;
}

+ (NSArray *)objectWithResponseData:(NSArray *)responseData {
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:responseData.count];
    for (NSDictionary *dictionary in responseData) {
        ProtocolForCommissionResponseDto *protocolForCommissionResponseDto = [[ProtocolForCommissionResponseDto alloc] initWithDictionary:dictionary];
        [array addObject:protocolForCommissionResponseDto];
    }
    return array;
}

@end
