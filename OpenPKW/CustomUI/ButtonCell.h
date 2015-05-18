//
//  ButtonCell.h
//  OpenPKW
//
//  Created by Lukasz Stocki on 16.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "BaseCell.h"

@class ButtonCell;

@protocol ButtonCellInteractionDelegate <NSObject>

- (void)userDidTapOnButtonCell:(ButtonCell *)buttonCell;

@end

@interface ButtonCell : BaseCell

@property (nonatomic, weak) id <ButtonCellInteractionDelegate> interactionDelegate;

@property (weak, nonatomic) IBOutlet UIButton *button;


@end
