//
//  ResultCompleteParentCommissionResponseDto.h
//  OpenPKW
//
//  Created by Piotr Tobolski on 10.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResultCompleteParentCommissionResponseDto : NSObject

@property (strong, nonatomic) NSString *name;

@property (nonatomic) NSUInteger commissionsCount;
@property (nonatomic) NSUInteger commissionsCountMax;

@property (nonatomic) NSUInteger attendance;
@property (nonatomic) NSUInteger attendanceMax;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
+ (NSArray *)objectWithResponseData:(NSArray *)responseData;

@end
