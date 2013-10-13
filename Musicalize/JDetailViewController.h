//
//  JDetailViewController.h
//  Musicalize
//
//  Created by Jean-Francois Pautex on 29/09/13.
//  Copyright (c) 2013 Jean-Francois Pautex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JGraph.h"
#import "ToneGeneratorViewController.h"

@interface JDetailViewController : UIViewController <UISplitViewControllerDelegate> {
    
    NSString                *url;           // url actuel de lecture data file
    BOOL                    enMarche;
    IBOutlet    JGraph      *graph;         // zone dessin
    
    // data table
    NSArray                 *arr;           // array data lus ligne data date,value
    
    // tone generateur
    ToneGeneratorViewController      *tonegene;
}


@property (strong, nonatomic) id     detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

- (IBAction)    play:(id)sender;



@end
