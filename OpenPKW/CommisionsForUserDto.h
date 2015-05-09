//
//  CommisionsForUserDto.h
//  OpenPKW
//
//  Created by Piotr Tobolski on 09.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommisionsForUserDto : NSObject

@property (strong, nonatomic) NSString *commisionId;
@property (strong, nonatomic) NSString *commisionPkwId;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *address;
@property (nonatomic) NSUInteger protocolCount;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

+ (NSArray *)objectWithResponseData:(NSArray *)responseData;

@end
