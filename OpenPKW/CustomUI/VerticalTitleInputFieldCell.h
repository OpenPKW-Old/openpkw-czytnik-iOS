//
//  VerticalTitleInputFieldCell.h
//  OpenPKW
//
//  Created by Lukasz Stocki on 01.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

@import UIKit;

#import "VerticalTitleInputFieldRowDescriptor.h"

@interface VerticalTitleInputFieldCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextField *inputTextField;


- (void)configureCellWithRowDescriptor:(VerticalTitleInputFieldRowDescriptor *)descriptor;

@end
