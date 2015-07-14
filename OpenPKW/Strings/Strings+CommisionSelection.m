//
//  Strings+CommisionSelection.m
//  OpenPKW
//
//  Created by Developer iOS on 14.07.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "Strings+CommisionSelection.h"

@implementation Strings (CommisionSelection)

+ (NSString *)electoralCommisionTitle {
	return @"Dodajesz Komisje z które będziesz przekazywać dane";
}

+ (NSString *)electoralCommisionTip {
	return @"Wpisz, Kod Terytorialny Gminy w której znajduje się Twoja Komisja (znajdziesz go na protokole wyborczym)";
}

+ (NSString *)electoralCommisionQRButtonCTA {
	return @"Skanuj kod QR";
}

+ (NSString *)electoralCommisionInputTitle {
	return @"Podaj Kod Terytorialny";
}

+ (NSString *)electoralCommisionInputHint {
	return @"xxxxxx-xxx";
}

@end
