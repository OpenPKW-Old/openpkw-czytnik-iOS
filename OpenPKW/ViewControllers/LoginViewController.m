//
//  LoginViewController.m
//  OpenPKW
//
//  Created by Piotr Tobolski on 25.04.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "LoginViewController.h"
#import "ResetPasswordViewController.h"
#import "RegisterViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (IBAction)loginTouchUpInside:(id)sender {
    [SVProgressHUD show];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD popActivity];
        //Instantiate and present view controller
    });
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.passwordTextField) {
        [self loginTouchUpInside:nil];
        return NO;
    }
    return [super textFieldShouldReturn:textField];
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ResetPassword"] ||
        [segue.identifier isEqualToString:@"Register"]) {
        BeforeLoginAbstractViewController *vc = (BeforeLoginAbstractViewController *)segue.destinationViewController;
        vc.login = self.loginTextField.text;
    }
}

@end
