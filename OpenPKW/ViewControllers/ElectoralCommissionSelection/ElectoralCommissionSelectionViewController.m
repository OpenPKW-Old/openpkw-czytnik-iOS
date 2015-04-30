//
//  ElectoralCommissionSelectionViewController.m
//  OpenPKW
//
//  Created by Developer iOS on 30.04.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "ElectoralCommissionSelectionViewController.h"

static NSString *const kElectoralCommissionSelectionCell          = @"ElectoralCommissionSelectionCell";
static NSString *const kSegueAddElectoralCommisionIdentifier      = @"AddElectoralCommision";
static NSString *const kSegueValidateElectoralCommisionIdentifier = @"ValidateElectoralCommision";

// temporary model
@interface Commission : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *address;

+ (instancetype)commisionWithName:(NSString *)name address:(NSString *)address;

@end

@implementation Commission

+ (instancetype)commisionWithName:(NSString *)name address:(NSString *)address {
	
	Commission *commision = [[self alloc] init];
	commision.name = name;
	commision.address = address;
	
	return commision;
}

@end

@interface ElectoralCommissionSelectionViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *tableViewHeadingLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

// temp model to show something
@property (nonatomic, strong) NSArray *model;

@end

@implementation ElectoralCommissionSelectionViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.tableView.delegate = self;
	self.tableView.dataSource = self;
	
	[self pupulateStubModel];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	[self performSegueWithIdentifier:kSegueValidateElectoralCommisionIdentifier
							  sender:self];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [self.model count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kElectoralCommissionSelectionCell
															forIndexPath:indexPath];
	
	[self configureCell:cell
		   forIndexPath:indexPath];
	
	return cell;
}

#pragma mark - Helper Methods
#pragma mark Cell Configuration

- (void)configureCell:(UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath {
	Commission *commision = self.model[indexPath.row];
	
	cell.textLabel.text = commision.name;
	cell.detailTextLabel.text = commision.address;
}

#pragma mark Temorary/Stubs
- (void)pupulateStubModel {
	self.model = @[ [Commission commisionWithName:@"Obwodowa Komisja Wyborcza nr: 2"
										  address:@"Szkołą Podstawowa nr 313 im. Bolka i Lolka\nul. Kantowa 32, 91-220 Łódź"],
					
					[Commission commisionWithName:@"Obwodowa Komisja Wyborcza nr: 2"
										  address:@"Szkołą Podstawowa nr 313 im. Bolka i Lolka\nul. Kantowa 32, 91-220 Łódź"],
					
					[Commission commisionWithName:@"Obwodowa Komisja Wyborcza nr: 2"
										  address:@"Szkołą Podstawowa nr 313 im. Bolka i Lolka\nul. Kantowa 32, 91-220 Łódź"],
					
					[Commission commisionWithName:@"Obwodowa Komisja Wyborcza nr: 2"
										  address:@"Szkołą Podstawowa nr 313 im. Bolka i Lolka\nul. Kantowa 32, 91-220 Łódź"],
					
					[Commission commisionWithName:@"Obwodowa Komisja Wyborcza nr: 2"
										  address:@"Szkołą Podstawowa nr 313 im. Bolka i Lolka\nul. Kantowa 32, 91-220 Łódź"],
					
					[Commission commisionWithName:@"Obwodowa Komisja Wyborcza nr: 2"
										  address:@"Szkołą Podstawowa nr 313 im. Bolka i Lolka\nul. Kantowa 32, 91-220 Łódź"],
					
					[Commission commisionWithName:@"Obwodowa Komisja Wyborcza nr: 2"
										  address:@"Szkołą Podstawowa nr 313 im. Bolka i Lolka\nul. Kantowa 32, 91-220 Łódź"],
					
					[Commission commisionWithName:@"Obwodowa Komisja Wyborcza nr: 2"
										  address:@"Szkołą Podstawowa nr 313 im. Bolka i Lolka\nul. Kantowa 32, 91-220 Łódź"],
					
					[Commission commisionWithName:@"Obwodowa Komisja Wyborcza nr: 2"
										  address:@"Szkołą Podstawowa nr 313 im. Bolka i Lolka\nul. Kantowa 32, 91-220 Łódź"],
					
					[Commission commisionWithName:@"Obwodowa Komisja Wyborcza nr: 2"
										  address:@"Szkołą Podstawowa nr 313 im. Bolka i Lolka\nul. Kantowa 32, 91-220 Łódź"]
					];
}

@end
