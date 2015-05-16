//
//  CountedTitleInputCell.m
//  OpenPKW
//
//  Created by Lukasz Stocki on 16.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "CountedTitleInputCell.h"

@implementation CountedTitleInputCell

- (void)configureCellWithRowDescriptor:(RowDescriptor *)descriptor
                           atIndexPath:(NSIndexPath *)path
                            idexOffset:(NSInteger)indexOffset {
    
    self.nameLabel.text = descriptor.displayText;
    
    if (path) {
        
        NSString *count = [@(path.row + indexOffset) stringValue];
        self.countLabel.text = [NSString stringWithFormat:@"%@.", count];
    }
    
}

- (void)configureCellWithRowDescriptor:(RowDescriptor *)descriptor {
    [self configureCellWithRowDescriptor:descriptor
                             atIndexPath:nil
                              idexOffset:0];
}

- (void)prepareForReuse {
    self.input.delegate = nil;
}

@end
