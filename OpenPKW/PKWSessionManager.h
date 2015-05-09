//
//  PKWSessionManager.h
//  OpenPKW
//
//  Created by Piotr Tobolski on 09.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "LoginResponseDto.h"
#import "CommisionsForUserDto.h"

@interface PKWSessionManager : AFHTTPSessionManager

- (void)loginWithLogin:(NSString *)login
              password:(NSString *)password
               success:(void(^)(LoginResponseDto *response))success
               failure:(void(^)(NSString *error))failure;

- (void)logoutWithSuccess:(void(^)())success
                  failure:(void(^)(NSString *error))failure;

- (void)commissionsForUser:(NSString *)userId
                   success:(void(^)(NSArray *response))success
                   failure:(void(^)(NSString *error))failure;

@end
