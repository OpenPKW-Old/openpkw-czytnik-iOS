//
//  BeforeLoginAbstractViewController.h
//  OpenPKW
//
//  Created by Piotr Tobolski on 25.04.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "AbstractViewController.h"

@interface BeforeLoginAbstractViewController : AbstractViewController <UITextFieldDelegate>

@property (strong, nonatomic) NSString *login;

@property (weak, nonatomic) IBOutlet UITextField *loginTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;

@end
