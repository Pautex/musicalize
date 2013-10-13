//
//  JSettingController.m
//  Musicalize
//
//  Created by Jean-Francois Pautex on 29/09/13.
//  Copyright (c) 2013 Jean-Francois Pautex. All rights reserved.
//

#import "JSettingController.h"

@interface JSettingController ()

@end

@implementation JSettingController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
    }
    NSLog(@"detail %@",[newDetailItem valueForKey:@"url"] );
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    urlField.text = [_detailItem valueForKey:@"url"];
    nomField.text = [_detailItem valueForKey:@"nom"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction) nouveauURL:(UITextField* )sender {
    
    // NSLog(@"new");
    [_detailItem setValue:sender.text forKey:@"url"];
}

- (IBAction) nouveauNom:(UITextField*)sender{
    [_detailItem setValue:sender.text forKey:@"nom"];
}

@end
