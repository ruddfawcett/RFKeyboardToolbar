//
//  ViewController.m
//  RFKeyboardToolbarDemo
//
//  Created by Rex Finn on 12/3/13.
//  Copyright (c) 2013 Rex Finn. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"RFKeyboardToolbar";
    
    RFExampleToolbarButton *exampleButton = [RFExampleToolbarButton buttonWithTitle:@"Example"];
    
    _textView = [[UITextView alloc] initWithFrame:self.view.bounds];
    
    [RFKeyboardToolbar addToTextView:_textView withButtons:@[exampleButton]];
    
    [self.view addSubview:_textView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
