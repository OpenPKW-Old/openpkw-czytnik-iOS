//
//  LoginResponseDto.h
//  OpenPKW
//
//  Created by Piotr Tobolski on 09.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginResponseDto : NSObject

@property (strong, nonatomic) NSString *userId;
@property (strong, nonatomic) NSString *fullname;
@property (strong, nonatomic) NSString *firstname;
@property (strong, nonatomic) NSString *login;
@property (strong, nonatomic) NSString *token;
@property (nonatomic) BOOL sessionActive;
@property (strong, nonatomic) NSDate *sessionTimeout;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
