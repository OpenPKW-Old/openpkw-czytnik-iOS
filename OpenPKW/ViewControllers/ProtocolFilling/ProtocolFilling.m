//
//  ProtocolFilling.m
//  OpenPKW
//
//  Created by Lukasz Stocki on 09.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "ProtocolFilling.h"

#import "BaseCell.h"
#import "ButtonCell.h"
#import "CountedTitleInputCell.h"
#import "Macros.h"
#import "ProtocolFilling+Descriptors.h"
#import "ProtocolFillingDataSource.h"
#import "TitleInputCell.h"

@interface ProtocolFilling () <ButtonCellInteractionDelegate, UITextFieldDelegate>

@property (nonatomic, strong) ProtocolFillingDataSource *dataSource;

@end

@implementation ProtocolFilling

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.candidatesList = [self setupTempCandidateList];
    self.dataSource = [[ProtocolFillingDataSource alloc] initWithTableDescriptor:[self setupTableDescriptor]];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataSource tableView:tableView numberOfRowsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.dataSource tableView:tableView cellForRowAtIndexPath:indexPath];
    
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.dataSource numberOfSectionsInTableView:tableView];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - UITextFieldDelegate

// TODO: implement some if needed

#pragma mark - Helper Methods

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath{
    RowDescriptor *rowDescriptor = [self.dataSource rowDescriptorForIndexPath:indexPath];
    
    if ([cell isKindOfClass:[BaseCell class]]) {
        [(BaseCell *)cell configureCellWithRowDescriptor:rowDescriptor];
        
        if ([cell isKindOfClass:[ButtonCell class]]) {
            ButtonCell *buttonCell = (ButtonCell *)cell;
            buttonCell.interactionDelegate = self;
        }
        else if ([cell isKindOfClass:[TitleInputCell class]]) {
            TitleInputCell *titleInputCell = (TitleInputCell *)cell;
            titleInputCell.inputTextField.delegate = self;
        }
        else if ([cell isKindOfClass:[CountedTitleInputCell class]]) {
            CountedTitleInputCell *countedCell = (CountedTitleInputCell *)cell;
            
            [countedCell configureCellWithRowDescriptor:rowDescriptor
                                            atIndexPath:indexPath
                                             idexOffset:0];
            
            countedCell.input.delegate = self;
        }
    }
    else {
        cell.textLabel.text = rowDescriptor.displayText;
    }
}

#pragma mark - ButtonCell Interaction Delegate

- (void)userDidTapOnButtonCell:(ButtonCell *)buttonCell {
    // TODO: handle button tap...
    NSLog(@"%s\t ", __PRETTY_FUNCTION__);
}

#pragma mark - Temporary Model Data Methods

- (NSArray *)setupTempCandidateList {
    
    return @[ [Candidate cadidateWithName:@"Jan Kowalski"],
              [Candidate cadidateWithName:@"Sierotka Marysia"],
              [Candidate cadidateWithName:@"Kuba Maliniak Rowniez O Bardzo Dlugim Imieni I Nazwisku Albowiem Walczyl Dzielnie I Dostal Wloscia Takiego Mamy Kandydata Jegomoscia"],
              [Candidate cadidateWithName:@"Macko z Bogdanca"],
              [Candidate cadidateWithName:@"Jurand"],
              [Candidate cadidateWithName:@"Jurand O Bardzo Warjacko Dlugim Imieniu I Nazwisku Do 4 Pokolenia"]];
}

@end
