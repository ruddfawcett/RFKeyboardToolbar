//
//  ViewController.m
//  RFKeyboardToolbarDemo
//
//  Created by Rudd Fawcett on 12/3/13.
//  Copyright (c) 2013 Rudd Fawcett. All rights reserved.
//

#import "ViewController.h"
#import "RFKeyboardToolbar.h"

@interface ViewController ()

@property (strong, nonatomic) UITextView *textView;
@property (strong, nonatomic) RFKeyboardToolbar *keyboardToolbar;

@end

@implementation UITextView (InsertWord)

- (void)insertWord:(NSString*)word {
    // insert a word into the field, adding a space before and/or after it as necessary
    NSCharacterSet *whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSRange selectedRange = self.selectedRange;
    NSString *text = self.text;
    BOOL hasSpaceBefore = selectedRange.location == 0 || [whitespace characterIsMember:[text characterAtIndex:selectedRange.location-1]];
    BOOL hasSpaceAfter = selectedRange.location+selectedRange.length == text.length || [whitespace characterIsMember:[text characterAtIndex:selectedRange.location+selectedRange.length]];
    
    NSMutableString *wordText = word.mutableCopy;
    if (!hasSpaceBefore) [wordText insertString:@" " atIndex:0];
    if (!hasSpaceAfter) [wordText appendString:@" "];
    [self insertText:wordText];
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"RFKeyboardToolbar";
    
    _textView = [[UITextView alloc] initWithFrame:self.view.bounds];
    
    NSMutableArray *buttons = NSMutableArray.array;
    
    NSNumberFormatter *numberFormatter = [NSNumberFormatter new];
    [numberFormatter setNumberStyle:NSNumberFormatterSpellOutStyle];
    
    for (int i = 1; i <= 20; i++) {
        RFToolbarButton *button = [RFToolbarButton buttonWithTitle:[numberFormatter stringFromNumber:@(i)] andEventHandler:^{
            [_textView insertText:@"You pressed a button!"];
        } forControlEvents:UIControlEventTouchUpInside];
        
        [buttons addObject:button];
    }
    
    _keyboardToolbar = [RFKeyboardToolbar toolbarWithButtons:buttons];
    _textView.inputAccessoryView = _keyboardToolbar;
    _textView.delegate = self;
    
    [self.view addSubview:_textView];
}

- (void)textViewDidChange:(UITextView *)textView {
    // count words
    NSArray *allWords = [textView.text.lowercaseString componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSCountedSet *words = [NSCountedSet new];
    for (__strong NSString *word in allWords) {
        word = [word stringByTrimmingCharactersInSet:[NSCharacterSet punctuationCharacterSet]];
        if (word.length == 0) continue;
        [words addObject:word];
    }
    
    // dictionary of existing words => buttons
    NSDictionary *oldButtons = [NSDictionary dictionaryWithObjects:_keyboardToolbar.buttons forKeys:[_keyboardToolbar.buttons valueForKey:@"title"]];
    
    // create new buttons
    NSMutableArray *newButtons = [NSMutableArray arrayWithCapacity:words.count];
    for (NSString *word in words) {
        // create or reuse button
        RFToolbarButton *button = oldButtons[word];
        if (button == nil) {
            button = [RFToolbarButton buttonWithTitle:word];
            [button addEventHandler:^{
                [_textView insertWord:word];
            } forControlEvents:UIControlEventTouchUpInside];
        }
        [newButtons addObject:button];
    }
    
    // sort by frequency and alphabetically
    [newButtons sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSUInteger count1 = [words countForObject:[obj1 title]];
        NSUInteger count2 = [words countForObject:[obj2 title]];
        if (count1 == count2) return [[obj1 title] compare:[obj2 title]];
        return count1 > count2 ? NSOrderedAscending : NSOrderedDescending;
    }];
    [_keyboardToolbar setButtons:newButtons animated:YES];
}

@end
