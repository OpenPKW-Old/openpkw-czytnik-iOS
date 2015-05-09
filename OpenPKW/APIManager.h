//
//  APIManager.h
//  OpenPKW
//
//  Created by Piotr Tobolski on 09.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LoginResponseDto.h"

@interface APIManager : NSObject

+ (void)loginWithLogin:(NSString *)login
              password:(NSString *)password
               success:(void(^)(LoginResponseDto *response))success
               failure:(void(^)(NSString *error))failure;

+ (void)logoutWithSuccess:(void(^)())success
                  failure:(void(^)(NSString *error))failure;

+ (void)commissionsForCurrentUserSuccess:(void(^)(NSArray *response))success
                                 failure:(void(^)(NSString *error))failure;

@end
