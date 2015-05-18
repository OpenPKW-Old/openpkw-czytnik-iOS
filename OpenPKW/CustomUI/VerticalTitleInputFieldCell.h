//
//  VerticalTitleInputFieldCell.h
//  OpenPKW
//
//  Created by Lukasz Stocki on 01.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

@import UIKit;

#import "BaseCell.h"

@interface VerticalTitleInputFieldCell : BaseCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextField *inputTextField;

@end
