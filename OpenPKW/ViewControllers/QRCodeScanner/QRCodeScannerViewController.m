//
//  QRCodeScannerViewController.m
//  OpenPKW
//
//  Created by Developer iOS on 14.07.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "QRCodeScannerViewController.h"

#import "MTBBarcodeScanner.h"

@interface QRCodeScannerViewController ()

@property (nonatomic, strong, nullable) MTBBarcodeScanner *scanner;
@property (weak, nonatomic) IBOutlet UIView *scannerView;

@end

@implementation QRCodeScannerViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	[self configureNaviagationItems];
	
	self.scanner = [[MTBBarcodeScanner alloc] initWithMetadataObjectTypes:@[AVMetadataObjectTypeQRCode]
															  previewView:self.scannerView];
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	
	[self.scanner startScanningWithResultBlock:^(NSArray *codes) {
		for (AVMetadataMachineReadableCodeObject *code in codes) {
			NSLog(@"Found code: %@", code.stringValue);
		}
	}];
}

- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
	
	[self.scanner stopScanning];
}

#pragma mark - Setup

- (void)configureNaviagationItems {
	UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
																				target:self
																				action:@selector(doneButtonPressed)];
	
	self.navigationItem.rightBarButtonItem = doneButton;
}

#pragma mark - User Interaction
- (void)doneButtonPressed {
	[self dismissViewControllerAnimated:YES completion:nil];
}

@end
