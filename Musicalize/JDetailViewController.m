//
//  JDetailViewController.m
//  Musicalize
//
//  Created by Jean-Francois Pautex on 29/09/13.
//  Copyright (c) 2013 Jean-Francois Pautex. All rights reserved.
//

#import "JDetailViewController.h"

@interface JDetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation JDetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [[self.detailItem valueForKey:@"nom"] description];
        self.title = [[self.detailItem valueForKey:@"nom"] description];
        url = [[self.detailItem valueForKey:@"url"] description];
        
        NSLog(@"irl = %@", url);
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    [self dataReader];
}

- (void) viewWillAppear:(BOOL)animated
{
    enMarche = TRUE;
    
    // creation generateur
    tonegene = [[ToneGeneratorViewController alloc] init];
    tonegene.frequency = 0;
    [tonegene togglePlay];
    
    [self performSelector:@selector(boucle:) withObject:arr afterDelay:2];
}

- (void) viewDidDisappear:(BOOL)animated
{
    enMarche = FALSE;
    [tonegene stop];
}

// read data from url
- (void) dataReader
{
    // read data http://192.168.0.102/soundData.php
    NSURL     *durl = [NSURL URLWithString:url];
    NSString  *dat  = [NSString stringWithContentsOfURL:durl encoding:NSUTF8StringEncoding error:nil];      // ou @"\x0A"
    arr             = [dat componentsSeparatedByCharactersInSet:[NSCharacterSet controlCharacterSet]];      // ligne csv
    
    // NSLog(@"arr = %@",arr);
}

// boucle de provider data
- (void) boucle:(NSArray*)table {
    
    static int index = 0;
    NSString *value = nil;
    
    if( table.count > index) {
        NSString *ligne = [table objectAtIndex:index];          // 1 ligne date,val
        NSArray  *cmp   = [ligne componentsSeparatedByString:@";"];
        if( cmp.count == 2) {
            value = [cmp objectAtIndex:1];
        }
        else {
            NSLog(@"fin boucle ligne = %@", ligne);
            [tonegene stop];
            return;
        }
    }
    
    if( index++ >= table.count) index = 0;
    
    double frequency   = value.doubleValue * 200.0;  // 20A = 4000Hz
    
    if( tonegene)
        tonegene.frequency = frequency;
    
    if( graph)
        [graph storeData:frequency/50];
    
    if( enMarche)
        [self performSelector:@selector(boucle:) withObject:arr afterDelay:0.005];
    
    // NSLog(@"frequency = %f", frequency);
}

#pragma mark - ACTION
- (IBAction) play:(id)sender
{
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

@end
