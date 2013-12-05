//
//  ViewController.m
//  StampView
//
//  Created by kitano on 2013/12/03.
//  Copyright (c) 2013年 kitano. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    StampView *stampView = [[StampView alloc] initWithFrame:CGRectMake(50, 50, 150, 150)];
    stampView.delegate = self;
    [stampView setImage:[UIImage imageNamed:@"heart"]];
    [self.view addSubview:stampView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)addImage:(UIButton*)sender
{
    [self clearStampView];
    StampView *stampView = [[StampView alloc] initWithFrame:CGRectMake(50, 50, 150, 150)];
    stampView.delegate = self;
    [stampView setImage:[UIImage imageNamed:@"heart"]];
    [self.view addSubview:stampView];
}

-(void)clearStampView
{
    NSArray *subViews = [self.view subviews];
    for(int i=0;i<[subViews count];i++) {
        if([subViews[i] isKindOfClass:[StampView class]]) {
            StampView *tmpView = subViews[i];
            [tmpView changeBorderView:YES];
        }
    }
}

-(void)startDrag:(StampView*)stampView
{
    [self clearStampView];
    [stampView changeBorderView:NO];
    [self.view bringSubviewToFront:stampView];
    
}


@end
