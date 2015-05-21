//
//  WelcomeViewController.m
//  OpenPKW
//
//  Created by Developer iOS on 21.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "WelcomeViewController.h"

#import "UIStoryboard+Storyboards.h"

static NSString *const kWebViewSegueId = @"ShowWebView";

@interface WelcomeViewController ()

@property (weak, nonatomic) IBOutlet UIControl *goToLogin;
@property (weak, nonatomic) IBOutlet UIControl *goToPage;

@end


@implementation WelcomeViewController

- (void)viewWillAppear:(BOOL)animated {
	
	if (self.navigationController.navigationBarHidden == NO) {
		
		[self.navigationController setNavigationBarHidden:YES
												 animated:animated];
	}

	
	[super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
	[self.navigationController setNavigationBarHidden:NO
											 animated:animated];
	
	[super viewWillDisappear:animated];
}

- (void)viewDidLoad {
	[self.navigationController setNavigationBarHidden:YES
											 animated:NO];
	
	self.goToLogin.backgroundColor = [UIColor clearColor];
	self.goToPage.backgroundColor = [UIColor clearColor];
}

- (void)presentBeforeLogin {
	UIWindow *appDelegateWindow = [[[UIApplication sharedApplication] delegate] window];
	UIViewController *vcToPresent = [[UIStoryboard beforeLoginStoryboard] instantiateInitialViewController];
	
	[UIView transitionWithView:appDelegateWindow
					  duration:0.5
					   options:UIViewAnimationOptionTransitionFlipFromLeft
					animations:^{
						appDelegateWindow.rootViewController = vcToPresent;
					} completion:nil];
}

- (IBAction)goToWebView:(id)sender {
	[self performSegueWithIdentifier:kWebViewSegueId
							  sender:nil];
}

- (IBAction)goToLoginScreen:(id)sender {
	[self presentBeforeLogin];
}

@end
