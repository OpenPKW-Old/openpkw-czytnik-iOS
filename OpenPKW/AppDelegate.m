//
//  AppDelegate.m
//  OpenPKW
//
//  Created by Piotr Tobolski on 24.04.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "AppDelegate.h"
#import <SVProgressHUD/SVProgressHUD.h>
#import "UIStoryboard+Storyboards.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    return YES;
}

//Move to own class
#pragma mark - UI Customizaton
- (void)customizeUI {
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeGradient];
}

@end
