//
//  BeforeLoginAbstractViewController.m
//  OpenPKW
//
//  Created by Piotr Tobolski on 25.04.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "BeforeLoginAbstractViewController.h"


@interface BeforeLoginAbstractViewController ()

@end


@implementation BeforeLoginAbstractViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.loginTextField.text = self.login;
    
    self.loginTextField.delegate = self;
    self.passwordTextField.delegate = self;
    self.emailTextField.delegate = self;
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backgroundTap)];
    [self.view addGestureRecognizer:tapGestureRecognizer];
}

- (void)backgroundTap {
    [self.loginTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
    [self.emailTextField resignFirstResponder];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.loginTextField) {
        if (self.passwordTextField != nil) {
            [self.passwordTextField becomeFirstResponder];
        } else {
            [self.emailTextField becomeFirstResponder];
        }
        
    } if (textField == self.passwordTextField) {
        [self.emailTextField becomeFirstResponder];
    }
    return NO;
}

// Handle form validation

@end
