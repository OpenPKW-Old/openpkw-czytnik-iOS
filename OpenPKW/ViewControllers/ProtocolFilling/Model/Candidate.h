//
//  Candidate.h
//  OpenPKW
//
//  Created by Lukasz Stocki on 10.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

@import Foundation;

////
// Temp Model For Candidates Data
@interface Candidate : NSObject

@property (nonatomic, copy) NSString *cadidateName;

+ (instancetype)cadidateWithName:(NSString *)name;

@end
