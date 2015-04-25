//
//  UIStoryboard+Storyboards.h
//  OpenPKW
//
//  Created by Piotr Tobolski on 25.04.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIStoryboard (BeforeLogin)

+ (instancetype)storyboardBeforeLogin;
+ (id)instantiateLoginViewController;
+ (id)instantiateRegisterViewController;
+ (id)instantiateResetPasswordViewController;

@end
