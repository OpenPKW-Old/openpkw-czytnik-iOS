//
//  UIStoryboard+Storyboards.m
//  OpenPKW
//
//  Created by Piotr Tobolski on 25.04.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "UIStoryboard+Storyboards.h"

@implementation UIStoryboard (BeforeLogin)

+ (instancetype)storyboardBeforeLogin {
    return [self storyboardWithName:@"BeforeLogin" bundle:nil];
}

+ (id)instantiateBeforeLoginNavigationController {
    return [[self storyboardBeforeLogin] instantiateViewControllerWithIdentifier:@"BeforeLoginNavigationController"];
}

+ (id)instantiateLoginViewController {
    return [[self storyboardBeforeLogin] instantiateViewControllerWithIdentifier:@"LoginViewController"];
}

+ (id)instantiateRegisterViewController {
    return [[self storyboardBeforeLogin] instantiateViewControllerWithIdentifier:@"RegisterViewController"];
}

+ (id)instantiateResetPasswordViewController {
    return [[self storyboardBeforeLogin] instantiateViewControllerWithIdentifier:@"ResetPasswordViewController"];
}

@end


@implementation UIStoryboard (Andrzej)

+ (instancetype)andrzejStoryboard {
    return [self storyboardWithName:@"Andrzej" bundle:nil];
}

@end
