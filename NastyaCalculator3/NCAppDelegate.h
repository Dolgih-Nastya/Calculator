//
//  NCAppDelegate.h
//  NastyaCalculator3
//
//  Created by Maksim on 12.04.14.
//  Copyright (c) 2014 Nastya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../NCCalculatorViewController.h"

@interface NCAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
