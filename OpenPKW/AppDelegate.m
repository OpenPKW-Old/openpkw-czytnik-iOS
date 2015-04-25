//
//  AppDelegate.m
//  OpenPKW
//
//  Created by Piotr Tobolski on 24.04.2015.
//  Copyright (c) 2015 OpenPKW. All rights reserved.
//

#import "AppDelegate.h"
#import <CoreData/CoreData.h>
#import <RestKit/RestKit.h>
#import <MagicalRecord/CoreData+MagicalRecord.h>
#import <SVProgressHUD/SVProgressHUD.h>
#import "OpenPKWData.h"
#import "UIStoryboard+Storyboards.h"

// Use a class extension to expose access to MagicalRecord's private setter methods
@interface NSManagedObjectContext ()
+ (void)MR_setRootSavingContext:(NSManagedObjectContext *)context;
+ (void)MR_setDefaultContext:(NSManagedObjectContext *)moc;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[UIStoryboard storyboardBeforeLogin] instantiateInitialViewController];
    [self.window makeKeyAndVisible];
    
    [self setupCoreDataWithRestKit];
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [MagicalRecord cleanUp];
}

#pragma mark - Core Data
- (void)setupCoreDataWithRestKit {
    NSURL *modelURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"OpenPKW" ofType:@"momd"]];
    NSManagedObjectModel *managedObjectModel = [[[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL] mutableCopy];
    RKManagedObjectStore *managedObjectStore = [[RKManagedObjectStore alloc] initWithManagedObjectModel:managedObjectModel];
    NSString *storePath = [RKApplicationDataDirectory() stringByAppendingPathComponent:@"OpenPKW.sqlite"];
    [managedObjectStore addSQLitePersistentStoreAtPath:storePath fromSeedDatabaseAtPath:nil withConfiguration:nil options:nil error:nil];
    [managedObjectStore createManagedObjectContexts];
    
    // Configure MagicalRecord to use RestKit's Core Data stack
    [NSPersistentStoreCoordinator MR_setDefaultStoreCoordinator:managedObjectStore.persistentStoreCoordinator];
    [NSManagedObjectContext MR_setRootSavingContext:managedObjectStore.persistentStoreManagedObjectContext];
    [NSManagedObjectContext MR_setDefaultContext:managedObjectStore.mainQueueManagedObjectContext];
    
    NSString *apiURL = [OpenPKWData sharedInstance].apiURL;
    RKObjectManager *objectManager = [RKObjectManager managerWithBaseURL:[NSURL URLWithString:apiURL]];
    objectManager.managedObjectStore = managedObjectStore;
    [RKObjectManager setSharedManager:objectManager];
    //TODO: Create custom object manager with API mappings when available
}

//Move to own class
#pragma mark - UI Customizaton
- (void)customizeUI {
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeGradient];
}

@end
