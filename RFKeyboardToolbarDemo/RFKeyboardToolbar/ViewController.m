//
//  ViewController.m
//  RFKeyboardToolbarDemo
//
//  Created by Rex Finn on 12/3/13.
//  Copyright (c) 2013 Rex Finn. All rights reserved.
//

#import "ViewController.h"
#import "RFKeyboardToolbar.h"
#import "RFToolbarButton.h"

@interface ViewController ()

@property (nonatomic,strong) UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"RFKeyboardToolbar";
    
    _textView = [[UITextView alloc] initWithFrame:self.view.bounds];
    
    RFToolbarButton *exampleButton = [RFToolbarButton buttonWithTitle:@"Example"];
    
    [exampleButton addEventHandler:^{
        [_textView insertText:@"You pressed a button!"];
    } forControlEvents:UIControlEventTouchUpInside];
    
    _textView.inputAccessoryView = [RFKeyboardToolbar toolbarViewWithButtons:@[exampleButton]];
        
    [self.view addSubview:_textView];
}

@end
