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

- (void)userDidTapOnButtonCell:(ButtonCell * __nonnull)buttonCell;

@end

@interface ButtonCell : BaseCell

@property (nonatomic, weak, nullable) id <ButtonCellInteractionDelegate> interactionDelegate;

@property (weak, nonatomic, nonnull) IBOutlet UIButton *button;

@property (nonatomic, readonly, nullable) NSString *buttonTitle;

@end
