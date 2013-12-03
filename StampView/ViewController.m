//
//  ViewController.m
//  StampView
//
//  Created by kitano on 2013/12/03.
//  Copyright (c) 2013年 kitano. All rights reserved.
//

#import "ViewController.h"
#import "StampView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    StampView *stampView = [[StampView alloc] initWithFrame:CGRectMake(50, 50, 150, 150)];
    [stampView setImage:[UIImage imageNamed:@"stamp"]];
    [self.view addSubview:stampView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
