//
//  ViewController.m
//  RFKeyboardToolbarDemo
//
//  Created by Rudd Fawcett on 12/3/13.
//  Copyright (c) 2013 Rudd Fawcett. All rights reserved.
//

#import "ViewController.h"
#import "RFKeyboardToolbar.h"
#import "RFToolbarButton.h"

@interface ViewController ()

@property (nonatomic,strong) UITextView *textView;

@end

@implementation ViewController
{
    RFKeyboardToolbar *keyboardToolbar;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"RFKeyboardToolbar";
    
    _textView = [[UITextView alloc] initWithFrame:self.view.bounds];
    
    RFToolbarButton *exampleButton = [RFToolbarButton buttonWithTitle:@"Example"];
    
    [exampleButton addEventHandler:^{
        [_textView insertText:@"You pressed a button!"];
    } forControlEvents:UIControlEventTouchUpInside];
    
    keyboardToolbar = [RFKeyboardToolbar toolbarViewWithButtons:@[exampleButton]];
    _textView.inputAccessoryView = keyboardToolbar;
    _textView.delegate = self;
    
    [self.view addSubview:_textView];
}

- (void)textViewDidChange:(UITextView *)textView
{
    // get unique words in field
    NSSet *words = [NSSet setWithArray:[textView.text.lowercaseString componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]];
    
    // dictionary of existing words => buttons
    NSDictionary *oldButtons = [NSDictionary dictionaryWithObjects:keyboardToolbar.buttons forKeys:[keyboardToolbar.buttons valueForKey:@"title"]];
    
    // create new buttons
    NSMutableArray *newButtons = [NSMutableArray arrayWithCapacity:words.count];
    for (__strong NSString *word in words) {
        word = [word stringByTrimmingCharactersInSet:[NSCharacterSet punctuationCharacterSet]];
        if (word.length == 0) continue;
        // create or reuse button
        RFToolbarButton *button = oldButtons[word];
        if (button == nil) {
            button = [RFToolbarButton buttonWithTitle:word];
            [button addEventHandler:^{
                [_textView insertText:word];
            } forControlEvents:UIControlEventTouchUpInside];
        }
        [newButtons addObject:button];
    }
    
    [newButtons sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [[obj1 title] compare:[obj2 title]];
    }];
    [keyboardToolbar setButtons:newButtons animated:YES];
}

@end
