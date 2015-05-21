//
//  WelcomeViewController.m
//  OpenPKW
//
//  Created by Developer iOS on 21.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "WelcomeViewController.h"

@implementation WelcomeViewController

- (void)viewWillAppear:(BOOL)animated {
	[self.navigationController setNavigationBarHidden:YES
											 animated:animated];
	
	[super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
	[self.navigationController setNavigationBarHidden:NO
											 animated:animated];
	
	[super viewWillDisappear:animated];
}

@end
