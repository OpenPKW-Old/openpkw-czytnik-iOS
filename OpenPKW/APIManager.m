//
//  APIManager.m
//  OpenPKW
//
//  Created by Piotr Tobolski on 09.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "APIManager.h"
#import "PKWSessionManager.h"

@interface APIManager ()

@property (strong, nonatomic) PKWSessionManager *sessionManager;
@property (strong, nonatomic) LoginResponseDto *loginResponse;

@end


@implementation APIManager

+ (APIManager *)sharedInstance {
    static id singleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleton = [[[self class] alloc] init];
    });
    return singleton;
}

- (instancetype)init {
    if (self = [super init]) {
        _sessionManager = [[PKWSessionManager alloc] init];
    }
    return self;
}

#pragma mark -
+ (void)loginWithLogin:(NSString *)login password:(NSString *)password success:(void(^)(LoginResponseDto *response))success failure:(void(^)(NSString *error))failure {
    [[self sharedInstance].sessionManager loginWithLogin:login password:password success:^(LoginResponseDto *response) {
        [self sharedInstance].loginResponse = response;
        if (success) success(response);
    } failure:failure];
}

+ (void)logoutWithSuccess:(void (^)())success failure:(void (^)(NSString *))failure {
    [[self sharedInstance].sessionManager logoutWithSuccess:^{
        [self sharedInstance].loginResponse = nil;
    } failure:failure];
}

+ (void)commissionsForCurrentUserSuccess:(void (^)(NSArray *))success failure:(void (^)(NSString *))failure {
    NSString *userId = [self sharedInstance].loginResponse.userId;
    [[self sharedInstance].sessionManager commissionsForUser:userId success:success failure:failure];
}

+ (void)commissionWithPkwId:(NSString *)pkwId success:(void(^)(CommissionResponseDto *response))success failure:(void(^)(NSString *error))failure {
    [[self sharedInstance].sessionManager commissionWithPkwId:pkwId success:success failure:failure];
}

+ (void)protocolsForCommissionWithPkwId:(NSString *)pkwId success:(void(^)(NSArray *response))success failure:(void(^)(NSString *error))failure {
    [[self sharedInstance].sessionManager protocolsForCommissionWithPkwId:pkwId success:success failure:failure];
}

+ (void)sendProtocol:(ProtocolForCommissionRequestDto *)protocolForCommissionRequestDto forCommission:(NSString *)pkwId success:(void(^)())success failure:(void(^)(NSString *error))failure {
    [[self sharedInstance].sessionManager sendProtocol:protocolForCommissionRequestDto forCommission:pkwId success:success failure:failure];
}

+ (void)resultWithId:(NSString *)resultId success:(void(^)(ResultResponseDto *response))success failure:(void(^)(NSString *error))failure {
    [[self sharedInstance].sessionManager resultWithId:resultId success:success failure:failure];
}

+ (void)resultCompleteWithSuccess:(void(^)(ResultCompleteResponseDto *response))success failure:(void(^)(NSString *error))failure {
    [[self sharedInstance].sessionManager resultCompleteWithSuccess:success failure:failure];
}


@end
