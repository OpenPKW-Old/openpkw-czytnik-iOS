//
//  RegisterViewController.m
//  OpenPKW
//
//  Created by Piotr Tobolski on 25.04.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (IBAction)registerTouchUpInside:(id)sender {
    [SVProgressHUD show];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD popActivity];
        //Show alert "Twoje konto niebawem zostanie aktywowane. Czekaj na maila z potwierdzeniem aktywacji."
        [self.navigationController popViewControllerAnimated:YES];
    });
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.emailTextField) {
        [self registerTouchUpInside:nil];
        return NO;
    }
    return [super textFieldShouldReturn:textField];
}

@end
