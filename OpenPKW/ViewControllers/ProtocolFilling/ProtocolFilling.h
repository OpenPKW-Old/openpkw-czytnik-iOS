//
//  ProtocolFilling.h
//  OpenPKW
//
//  Created by Lukasz Stocki on 09.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "AbstractTableViewController.h"

#import "ProtocolFillingDataSource.h"

@interface ProtocolFilling : AbstractTableViewController

@property (nonatomic, strong) id <ProtocolFillingDataSource> dataSource;

@end
