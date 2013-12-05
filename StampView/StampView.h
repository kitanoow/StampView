//
//  StampView.h
//  StampView
//
//  Created by kitano on 2013/12/03.
//  Copyright (c) 2013年 kitano. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DragView.h"

@protocol StampViewDelegate;

@interface StampView : DragView
@property (nonatomic,retain) id<StampViewDelegate> delegate;
- (void)setImage:(UIImage*)image;
- (void)changeBorderView:(BOOL)statue;
@end

@protocol StampViewDelegate <NSObject>
-(void)startDrag:(StampView*)stampView;
@end