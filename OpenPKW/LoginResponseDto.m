//
//  LoginResponseDto.m
//  OpenPKW
//
//  Created by Piotr Tobolski on 09.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "LoginResponseDto.h"

@implementation LoginResponseDto

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [self init]) {
        _userId = [dictionary[@"id"] stringValue];
        _fullname = dictionary[@"fullname"];
        _firstname = dictionary[@"firstname"];
        _login = dictionary[@"login"];
        _token = dictionary[@"token"];
        _sessionActive = [dictionary[@"sessionActive"] boolValue];
        NSString *timestamp = dictionary[@"sessionTimeout"];
        if (timestamp != nil) {
            _sessionTimeout = [NSDate dateWithTimeIntervalSince1970:(timestamp.doubleValue / 1000.0)];
        }
    }
    return self;
}

@end
