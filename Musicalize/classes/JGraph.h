//
//  JGraph.h
//  test-graph
//
//  Created by Jean-Francois Pautex on 28/09/13.
//  Copyright (c) 2013 Jean-Francois Pautex. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kMaximumTable 3000

@interface JGraph : UIView {
    
    CGPoint     table[kMaximumTable];       // taille max table
    double      L;                          // 350 iphone
    double      H;                          // 200
    double      resolution;                 // 4 retina
    int         index;
}

// PUBLIC 
- (void) storeData:(double)val;

//
// 1
// 
@end
