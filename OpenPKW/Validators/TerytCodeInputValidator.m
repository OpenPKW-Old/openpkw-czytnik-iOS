//
//  TerytCodeInputValidator.m
//  OpenPKW
//
//  Created by Developer iOS on 21.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "TerytCodeInputValidator.h"

static NSString *const kSeparator = @"-";
static NSString *const kZero      = @"0";

static NSInteger const kTerytFirstPartLength  = 6;
static NSInteger const kTerytSecondPartLength = 3;

@implementation TerytCodeInputValidator



+ (BOOL)isValidTerrytCode:(NSString *)terytCode {
	
	BOOL containsDash = [terytCode containsString:kSeparator];
	
	NSArray *parts = [terytCode componentsSeparatedByString:kSeparator];
	BOOL shouldHaveTwoParts = ([parts count] == 2);
	
	// avoid reaching out of index
	if (shouldHaveTwoParts == NO) { return NO; }
	
	NSString *firstPart  = parts[0];
	NSString *secondPart = parts[1];
	
	// 'normalize string'
	firstPart = [self stringWithFilledZeros:firstPart
								totalLength:kTerytFirstPartLength];
	NSAssert([firstPart length] == kTerytFirstPartLength, @"Now it should be the correct length");
	
	secondPart = [self stringWithFilledZeros:secondPart
								 totalLength:kTerytSecondPartLength];
	NSAssert([firstPart length] == kTerytFirstPartLength, @"Now it should be the correct length");
	
	BOOL firstPartHasOnlyNumericValues = [self stringHasOnlyNumericValues:firstPart];
	BOOL secondPartHasOnlyNumericValues = [self stringHasOnlyNumericValues:secondPart];
	
	return containsDash & shouldHaveTwoParts & firstPartHasOnlyNumericValues & secondPartHasOnlyNumericValues;
}

+ (BOOL)stringHasOnlyNumericValues:(NSString *)stringToCheck {
	
	NSCharacterSet *numbersSet = [NSCharacterSet decimalDigitCharacterSet];
	NSCharacterSet *notNumbersSet = numbersSet.invertedSet;
	
	NSRange range = [stringToCheck rangeOfCharacterFromSet:notNumbersSet];
	
	return (range.location == NSNotFound);
}

+ (NSString *)stringWithFilledZeros:(NSString *)string totalLength:(NSInteger)expectedTotalLength {
	
	NSMutableString *workingString = [NSMutableString string];
	
	for (NSUInteger index = 0; index < (expectedTotalLength - string.length); index++) {
		[workingString appendString:kZero];
	}
	
	[workingString appendString:string];
	
	return [NSString stringWithString:workingString];
}

@end
