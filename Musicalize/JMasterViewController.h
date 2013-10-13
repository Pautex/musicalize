//
//  JMasterViewController.h
//  Musicalize
//
//  Created by Jean-Francois Pautex on 13/10/13.
//  Copyright (c) 2013 Jean-Francois Pautex. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JDetailViewController;

#import <CoreData/CoreData.h>

@interface JMasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) JDetailViewController *detailViewController;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
