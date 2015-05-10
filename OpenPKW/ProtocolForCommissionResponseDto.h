//
//  ProtocolForCommissionResponseDto.h
//  OpenPKW
//
//  Created by Piotr Tobolski on 10.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProtocolForCommissionResponseDto : NSObject

@property (strong, nonatomic) NSString *protocolId;
@property (strong, nonatomic) NSDate *uploadDate;
@property (nonatomic) NSUInteger ratedPositive;
@property (nonatomic) NSUInteger ratedNegative;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
+ (NSArray *)objectWithResponseData:(NSArray *)responseData;

@end
