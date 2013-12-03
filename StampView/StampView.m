//
//  StampView.m
//  StampView
//
//  Created by kitano on 2013/12/03.
//  Copyright (c) 2013年 kitano. All rights reserved.
//

#import "StampView.h"
#import "BorderView.h"
#define kControllerViewSize 30
#define kStampViewMinSize 50

@implementation StampView
{
    UIImageView *imageView;
    BorderView *borderView;
    UIImageView *controllerView;
    
    CGPoint startPos;
    float deltaAngle;
    
    float minWidth;
    float minHeight;
    
    
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        borderView = [[BorderView alloc] initWithFrame:CGRectInset(self.bounds,2,2)];
        [self addSubview:borderView];
        imageView = [[UIImageView alloc ] initWithFrame:CGRectInset(self.bounds,4,4)];
        imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self addSubview:imageView];

        
        controllerView = [[UIImageView alloc ]init];
        controllerView.image = [UIImage imageNamed:@"stamp_controller"];
        controllerView.frame =CGRectMake(self.bounds.size.width-kControllerViewSize,
                                         self.bounds.size.height-kControllerViewSize,
                                         kControllerViewSize, kControllerViewSize);
        controllerView.userInteractionEnabled = YES;
        UIPanGestureRecognizer* pan = [[UIPanGestureRecognizer alloc]
                                       initWithTarget:self
                                       action:@selector(resizeAndRotate:)];
        [controllerView addGestureRecognizer:pan];
        [self addSubview:controllerView];
        
        deltaAngle = atan2(self.frame.origin.y+self.frame.size.height - self.center.y,
                           self.frame.origin.x+self.frame.size.width - self.center.x);
        
        if (kStampViewMinSize > self.bounds.size.width*0.5) {
            minWidth = kStampViewMinSize;
            minHeight = self.bounds.size.height * (kStampViewMinSize/self.bounds.size.width);
        } else {
            minWidth  = self.bounds.size.width*0.5;
            minHeight = self.bounds.size.height*0.5;
        }

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


-(void)resizeAndRotate:(UIPanGestureRecognizer*)sender
{
    
    switch ([sender state]) {
        case UIGestureRecognizerStateBegan:
            startPos = [sender locationInView:self];
            break;
        case UIGestureRecognizerStateChanged:
            if (self.bounds.size.width < minWidth || self.bounds.size.height < minHeight)
            {
                self.bounds = CGRectMake(self.bounds.origin.x,
                                         self.bounds.origin.y,
                                         minWidth+1,
                                         minHeight+1);
                controllerView.frame =CGRectMake(self.bounds.size.width-kControllerViewSize,
                                                 self.bounds.size.height-kControllerViewSize,
                                                 kControllerViewSize,
                                                 kControllerViewSize);
                startPos = [sender locationInView:self];
                
            } else {
                
                CGPoint pos = [sender locationInView:self];
                float wDiff = pos.x - startPos.x;
                float hDiff = pos.y - startPos.y;
                
                if (wDiff < 0.0f && hDiff < 0.0f) {
                    float change = MIN(wDiff, hDiff);
                    wDiff = change;
                    hDiff = change;
                } else if (wDiff < 0.0f) {
                    hDiff = wDiff;
                } else if (hDiff < 0.0f) {
                    wDiff = hDiff;
                } else {
                    float change = MAX(wDiff, hDiff);
                    wDiff = change;
                    hDiff = change;
                }
                
                self.bounds = CGRectMake(self.bounds.origin.x, self.bounds.origin.y,
                                         self.bounds.size.width + (wDiff),
                                         self.bounds.size.height + (hDiff));
                controllerView.frame =CGRectMake(self.bounds.size.width-kControllerViewSize,
                                                 self.bounds.size.height-kControllerViewSize,
                                                 kControllerViewSize, kControllerViewSize);
                
            }
            float angle = atan2([sender locationInView:self.superview].y - self.center.y,
                                [sender locationInView:self.superview].x - self.center.x);
            self.transform = CGAffineTransformMakeRotation(-(deltaAngle - angle));
            borderView.frame = CGRectInset(self.bounds, 2, 2);
            startPos = [sender locationInView:self];
            break;
        case UIGestureRecognizerStateEnded:
            startPos = [sender locationInView:self];
            break;
        default:
            break;
    }
    
}

- (void)setImage:(UIImage*)image
{
    imageView.image = image;

    

}


@end
