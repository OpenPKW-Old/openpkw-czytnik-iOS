//
//  CountedTitleInputCell.h
//  OpenPKW
//
//  Created by Lukasz Stocki on 16.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "BaseCell.h"

@interface CountedTitleInputCell : BaseCell

@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UITextField *input;

- (void)configureCellWithRowDescriptor:(RowDescriptor *)descriptor
                           atIndexPath:(NSIndexPath *)path
                            idexOffset:(NSInteger)indexOffset;

@end
