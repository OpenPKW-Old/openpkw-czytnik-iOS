//
//  OpenPKWData.m
//  OpenPKW
//
//  Created by Piotr Tobolski on 24.04.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "OpenPKWData.h"

static NSString *const OpenPKWDataAPIURLKey = @"API_URL";
static NSString *const CreatePhotoUploadURL = @"CREATE_PHOTO_UPLOAD_URL";

@interface OpenPKWData ()

@property (nonatomic, strong) NSDictionary *data;

@end


@implementation OpenPKWData

+ (instancetype)sharedInstance {
    static id singleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleton = [[[self class] alloc] init];
    });
    return singleton;
}

- (instancetype)init {
    if (self = [super init]) {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"OpenPKW-Data" ofType:@"plist"];
        self.data = [[NSDictionary alloc] initWithContentsOfFile:filePath];
    }
    return self;
}

- (NSString *)apiURL {
    return self.data[OpenPKWDataAPIURLKey];
}

- (NSString *)createPhotoUploadURL {
    return self.data[CreatePhotoUploadURL];
}

@end
