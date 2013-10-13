//
//  JDetailViewController.h
//  Musicalize
//
//  Created by Jean-Francois Pautex on 13/10/13.
//  Copyright (c) 2013 Jean-Francois Pautex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
