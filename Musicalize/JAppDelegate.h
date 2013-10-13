//
//  JAppDelegate.h
//  Musicalize
//
//  Created by Jean-Francois Pautex on 29/09/13.
//  Copyright (c) 2013 Jean-Francois Pautex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
