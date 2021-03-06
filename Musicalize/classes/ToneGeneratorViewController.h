//
//  ToneGeneratorViewController.h
//  ToneGenerator
//
//  Created by Matt Gallagher on 2010/10/20.
//  Copyright 2010 Matt Gallagher. All rights reserved.
//
//  Permission is given to use this source code file, free of charge, in any
//  project, commercial or otherwise, entirely at your risk, with the condition
//  that any redistribution (in part or whole) of source code must retain
//  this copyright and permission notice. Attribution in compiled projects is
//  appreciated but not required.
//

#import <UIKit/UIKit.h>
#import <AudioUnit/AudioUnit.h>


@interface ToneGeneratorViewController : NSObject
{
	UIButton                *playButton;
	AudioComponentInstance  toneUnit;
    
@public
	double      frequency;
	double      sampleRate;
	double      theta;
    NSArray     *arr;
}


@property (readwrite, nonatomic)    double      frequency;



- (void)    togglePlay;
- (void)    stop;

@end

