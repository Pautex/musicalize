//
//  JSettingController.h
//  Musicalize
//
//  Created by Jean-Francois Pautex on 29/09/13.
//  Copyright (c) 2013 Jean-Francois Pautex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSettingController : UIViewController {
    
    IBOutlet    UITextField     *urlField;
    IBOutlet    UITextField     *nomField;
}

- (IBAction) nouveauURL:(UITextField*)sender;
- (IBAction) nouveauNom:(UITextField*)sender;

@property (strong, nonatomic) id        detailItem;


@end
