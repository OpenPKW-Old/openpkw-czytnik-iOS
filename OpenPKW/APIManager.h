//
//  APIManager.h
//  OpenPKW
//
//  Created by Piotr Tobolski on 09.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LoginResponseDto.h"
#import "CommisionsForUserResponseDto.h"
#import "CommissionResponseDto.h"
#import "ProtocolForCommissionResponseDto.h"
#import "ProtocolForCommissionRequestDto.h"
#import "ResultResponseDto.h"
#import "ResultCompleteResponseDto.h"


@interface APIManager : NSObject

+ (void)loginWithLogin:(NSString *)login
              password:(NSString *)password
               success:(void(^)(LoginResponseDto *response))success
               failure:(void(^)(NSString *error))failure;

+ (void)logoutWithSuccess:(void(^)())success
                  failure:(void(^)(NSString *error))failure;

+ (void)commissionsForCurrentUserSuccess:(void(^)(NSArray *response))success
                                 failure:(void(^)(NSString *error))failure;

+ (void)commissionWithPkwId:(NSString *)pkwId
                    success:(void(^)(CommissionResponseDto *response))success
                    failure:(void(^)(NSString *error))failure;

+ (void)protocolsForCommissionWithPkwId:(NSString *)pkwId
                                success:(void(^)(NSArray *response))success
                                failure:(void(^)(NSString *error))failure;

+ (void)sendProtocol:(ProtocolForCommissionRequestDto *)protocolForCommissionRequestDto
       forCommission:(NSString *)pkwId
             success:(void(^)())success
             failure:(void(^)(NSString *error))failure;

+ (void)resultWithId:(NSString *)resultId
             success:(void(^)(ResultResponseDto *response))success
             failure:(void(^)(NSString *error))failure;

+ (void)resultCompleteWithSuccess:(void(^)(ResultCompleteResponseDto *response))success
                          failure:(void(^)(NSString *error))failure;


@end
