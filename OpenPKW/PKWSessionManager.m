//
//  PKWSessionManager.m
//  OpenPKW
//
//  Created by Piotr Tobolski on 09.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "PKWSessionManager.h"

#import <AFNetworking/AFNetworking.h>
#import "OpenPKWData.h"

static NSString *const PKWHeaderFieldLogin          = @"X-OPW-login";
static NSString *const PKWHeaderFieldPassword       = @"X-OPW-password";
static NSString *const PKWHeaderFieldToken          = @"X-OPW-token";

static NSString *const PKWPathLogin                 = @"user/login";
static NSString *const PKWPathLogout                = @"user/logout";
static NSString *const PKWPathRegister              = @"user/register";
static NSString *const PKWPathCommissionsForUser    = @"user/{id}/obwodowa";
static NSString *const PKWPathCommission            = @"komisja/{id}";
static NSString *const PKWPathProtocolForCommission = @"komisja/{id}/protokol";
static NSString *const PKWPathResult                = @"wynik/{id}";
static NSString *const PKWPathResultComplete        = @"wynik/complete";

@implementation PKWSessionManager

- (instancetype)init {
    NSURL *url = [NSURL URLWithString:[OpenPKWData sharedInstance].apiURL];
    if (self = [self initWithBaseURL:url]) {
        self.responseSerializer = [AFJSONResponseSerializer serializer];
        self.requestSerializer = [AFJSONRequestSerializer serializer];
        [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    }
    return self;
}

#pragma mark - Error Handling
- (NSURLSessionDataTask *)dataTaskWithRequest:(NSURLRequest *)request completionHandler:(void (^)(NSURLResponse *, id, NSError *))completionHandler {
    __block NSURLSessionDataTask *dataTask = nil;
    dataTask = [super dataTaskWithRequest:request completionHandler:^(NSURLResponse * __unused response, id responseObject, NSError *error){
        if (error != nil) {
            [self.requestSerializer setValue:nil forHTTPHeaderField:PKWHeaderFieldLogin];
            [self.requestSerializer setValue:nil forHTTPHeaderField:PKWHeaderFieldToken];
            //TODO: check error and dataTaskResponse and and handle it
        }
        if (completionHandler) completionHandler(response, responseObject, error);
    }];
    return dataTask;
}

#pragma mark -
- (void)loginWithLogin:(NSString *)login password:(NSString *)password success:(void(^)(LoginResponseDto *))success failure:(void(^)(NSString *))failure {
    NSMutableURLRequest *request = [self.requestSerializer requestWithMethod:@"GET" URLString:[[NSURL URLWithString:PKWPathLogin relativeToURL:self.baseURL] absoluteString] parameters:nil error:nil];
    [request setValue:login forHTTPHeaderField:PKWHeaderFieldLogin];
    [request setValue:password forHTTPHeaderField:PKWHeaderFieldPassword];
    [request setValue:nil forHTTPHeaderField:PKWHeaderFieldToken];
    
    __block NSURLSessionDataTask *dataTask = nil;
    dataTask = [self dataTaskWithRequest:request completionHandler:^(NSURLResponse * __unused response, id responseObject, NSError *error) {
        if (error == nil) {
            LoginResponseDto *loginResponseDto = [[LoginResponseDto alloc] initWithDictionary:responseObject];
            [self.requestSerializer setValue:loginResponseDto.login forHTTPHeaderField:PKWHeaderFieldLogin];
            [self.requestSerializer setValue:loginResponseDto.token forHTTPHeaderField:PKWHeaderFieldToken];
            if (success) success(loginResponseDto);
            
        } else {
            if (failure) failure(error.localizedRecoverySuggestion);
        }
    }];
    
    [dataTask resume];
}

- (void)logoutWithSuccess:(void (^)())success failure:(void (^)(NSString *))failure {
    [self GET:PKWPathLogout parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        [self.requestSerializer setValue:nil forHTTPHeaderField:PKWHeaderFieldLogin];
        [self.requestSerializer setValue:nil forHTTPHeaderField:PKWHeaderFieldToken];
        if (success) success();
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) failure(error.localizedRecoverySuggestion);
    }];
}

//TODO: register

- (void)commissionsForUser:(NSString *)userId success:(void (^)(NSArray *))success failure:(void (^)(NSString *))failure {
    NSString *path = [PKWPathCommissionsForUser stringByReplacingOccurrencesOfString:@"{id}" withString:userId];
    [self GET:path parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        if (success) {
            NSArray *parsedResponse = [CommisionsForUserResponseDto objectWithResponseData:responseObject];
            if (success) success(parsedResponse);
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) failure(error.localizedRecoverySuggestion);
    }];
}

- (void)commissionWithPkwId:(NSString *)pkwId success:(void (^)(CommissionResponseDto *))success failure:(void (^)(NSString *))failure {
    NSString *path = [PKWPathCommission stringByReplacingOccurrencesOfString:@"{id}" withString:pkwId];
    [self GET:path parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        if (success) {
            CommissionResponseDto *commissionResponseDto = [[CommissionResponseDto alloc] initWithDictionary:responseObject];
            success(commissionResponseDto);
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) failure(error.localizedRecoverySuggestion);
    }];
}

- (void)protocolsForCommissionWithPkwId:(NSString *)pkwId success:(void (^)(NSArray *))success failure:(void (^)(NSString *))failure {
    NSString *path = [PKWPathProtocolForCommission stringByReplacingOccurrencesOfString:@"{id}" withString:pkwId];
    [self GET:path parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        if (success) {
            NSArray *parsedResponse = [ProtocolForCommissionResponseDto objectWithResponseData:responseObject];
            if (success) success(parsedResponse);
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) failure(error.localizedRecoverySuggestion);
    }];
}

- (void)sendProtocol:(ProtocolForCommissionRequestDto *)protocolForCommissionRequestDto forCommission:(NSString *)pkwId success:(void (^)())success failure:(void (^)(NSString *))failure {
    NSString *path = [PKWPathProtocolForCommission stringByReplacingOccurrencesOfString:@"{id}" withString:pkwId];
    [self POST:path parameters:protocolForCommissionRequestDto.dictionaryRepresentation success:^(NSURLSessionDataTask *task, id responseObject) {
        if (success) success();
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) failure(error.localizedRecoverySuggestion);
    }];
}

- (void)resultWithId:(NSString *)resultId success:(void (^)(ResultResponseDto *))success failure:(void (^)(NSString *))failure {
    NSString *path = [PKWPathResult stringByReplacingOccurrencesOfString:@"{id}" withString:resultId];
    [self GET:path parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        if (success) {
            ResultResponseDto *resultResponseDto = [[ResultResponseDto alloc] initWithDictionary:responseObject];
            success(resultResponseDto);
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) failure(error.localizedRecoverySuggestion);
    }];
}

- (void)resultCompleteWithSuccess:(void (^)(ResultCompleteResponseDto *))success failure:(void (^)(NSString *))failure {
    [self GET:PKWPathResultComplete parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        if (success) {
            ResultCompleteResponseDto *resultCompleteResponseDto = [[ResultCompleteResponseDto alloc] initWithDictionary:responseObject];
            success(resultCompleteResponseDto);
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) failure(error.localizedRecoverySuggestion);
    }];
}

@end
