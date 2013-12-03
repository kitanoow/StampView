//
//  DragImageView.m
//  StampView
//
//  Created by kitano on 2013/12/03.
//  Copyright (c) 2013年 kitano. All rights reserved.
//

#import "DragView.h"

@implementation DragView
{
    CGPoint startPos;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.userInteractionEnabled = YES;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void) touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event
{
    startPos = [[touches anyObject] locationInView:self.superview];
}

- (void) touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event
{
    CGPoint pos = [[touches anyObject] locationInView:self.superview];
    CGPoint newCenter = CGPointMake(self.center.x + pos.x - startPos.x,
                                    self.center.y + pos.y - startPos.y);
    self.center = newCenter;
    startPos = pos;
}
@end
