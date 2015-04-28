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


// I couldn't think of good name for this storyboard so it's called Andrzej for now. If you have better name change it or create a pull request :-)
@interface UIStoryboard (Andrzej)

+ (instancetype)andrzejStoryboard;

@end