//
//  StampBorderView.m
//  StampView
//
//  Created by kitano on 2013/12/03.
//  Copyright (c) 2013年 kitano. All rights reserved.
//

#import "BorderView.h"

@implementation BorderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGContextSetLineWidth(context, 1.0);
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextAddRect(context, CGRectInset(self.bounds, 2, 2));
    CGContextStrokePath(context);
    CGContextRestoreGState(context);
}

@end
