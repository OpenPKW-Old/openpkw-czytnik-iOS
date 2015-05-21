//
//  RWDViewController.m
//  OpenPKW
//
//  Created by Developer iOS on 21.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "RWDViewController.h"

@interface RWDViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation RWDViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	NSURL *url = [NSURL URLWithString:@"http://ios.open-pkw.pl"];
	NSURLRequest *request = [NSURLRequest requestWithURL:url];
	
	[self.webView loadRequest:request];
}

@end
