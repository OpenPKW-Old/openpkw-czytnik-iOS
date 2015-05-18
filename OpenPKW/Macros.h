//
//  Macros.h
//  OpenPKW
//
//  Created by Lukasz Stocki on 10.05.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#ifndef OpenPKW_Macros_h
#define OpenPKW_Macros_h

#ifndef EARLY_EXIT_IF_SELF_IS_NIL
#define EARLY_EXIT_IF_SELF_IS_NIL if (!(self = [super init])) { return nil; }
#endif

#endif
