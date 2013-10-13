//
//  JGraph.m
//  test-graph
//
//  Created by Jean-Francois Pautex on 28/09/13.
//  Copyright (c) 2013 Jean-Francois Pautex. All rights reserved.
//  dessin de graph deroulant

#import "JGraph.h"

@implementation JGraph

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// 1er appel ouverture
- (void) awakeFromNib {
    resolution = 4;
    [self resetData];
    
}

// table reset 300 data point kMaximumTable
- (void) resetData
{
    NSLog(@"reset graph");
    for (int i = 0; i < kMaximumTable; i++) {
        table[i] = CGPointMake(i, 0);
    }
    index = 0;
}


// arrive data
- (void) storeData:(double)val {
    double K = resolution * L;
    if(index > K - 1) {
        index = K - 1;
        // deplace tout
        for (int j = 1; j< K; j++) {
            table[j-1].y = table[j].y;
        }
    }
    table[index] = CGPointMake(index, val);
    index++;
    [self setNeedsDisplay];
    // NSLog(@"deplace %d, val = %f",i, val);
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    //CGContextTranslateCTM(context, -k, 0);
    //CGContextRotateCTM( context, 3.14/2);
    
    // ligne H
    CGContextBeginPath(context);
    CGContextSetLineWidth(context, 0.25);
    CGContextSetRGBFillColor(context, 1.0, 0.0, 0.0, 1.0);
    CGContextSetRGBStrokeColor(context, 0, 0, 1, 1.0);
    
    // seuil est angle degres
    L    = rect.size.width;      // 25
    H    = rect.size.height;     // 25
    
    CGMutablePathRef pathRef = CGPathCreateMutable();
    CGPathMoveToPoint(pathRef, NULL, 0, H/2);
    CGPathAddLineToPoint(pathRef, NULL, L, H/2);
    CGPathMoveToPoint(pathRef, NULL, 0, H/4);
    CGPathAddLineToPoint(pathRef, NULL, L, H/4);
    CGPathMoveToPoint(pathRef, NULL, 0, 3*H/4);
    CGPathAddLineToPoint(pathRef, NULL, L, 3*H/4);
    
    CGPathCloseSubpath(pathRef);
    CGContextAddPath(context, pathRef);
    CGContextStrokePath(context);
    CGPathRelease(pathRef);
    
    
    // table
    CGContextSetRGBStrokeColor(context, 0.1, 0.1, 0.1, 1.0);
    CGContextSetLineWidth(context, 0.25);
    CGContextMoveToPoint(context, 0, H/2);
    for( int i=0; i < resolution*L; i++){
        CGContextAddLineToPoint(context, table[i].x/resolution, 3*H/4 - table[i].y);
    }
    CGContextStrokePath(context);
    
    
    
}

- (void) lineTo:(CGContextRef)context  x:(double)x y:(double)y
{
    
    
}






@end
