//
//  CandidateDto.h
//  OpenPKW
//
//  Created by Piotr Tobolski on 10.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CandidateResponseDto : NSObject

@property (strong, nonatomic) NSString *pkwId;
@property (strong, nonatomic) NSString *firstname;
@property (strong, nonatomic) NSString *lastname;
@property (nonatomic) NSUInteger votesCount;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
+ (NSArray *)objectWithResponseData:(NSArray *)responseData;

@end
