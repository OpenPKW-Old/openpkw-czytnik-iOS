//
//  OpenPKWData.h
//  OpenPKW
//
//  Created by Piotr Tobolski on 24.04.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OpenPKWData : NSObject

@property (nonatomic, readonly) NSString *apiURL;
@property (nonatomic, readonly) NSString *createPhotoUploadURL;

+ (instancetype)sharedInstance;

@end
