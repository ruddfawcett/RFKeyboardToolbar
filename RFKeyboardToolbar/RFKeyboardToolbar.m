//
//  RFKeyboardToolbar.m
//
//  Created by Rex Finn on 12/3/13.
//  Copyright (c) 2013 Rex Finn. All rights reserved.
//

#import "RFKeyboardToolbar.h"

@interface RFKeyboardToolbar ()

@property (nonatomic,strong) UIView *toolbarView;
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) CALayer *topBorder;
@property (nonatomic,strong) NSArray *buttonsToAdd;

@end

@implementation RFKeyboardToolbar

- (id)initWithButtons:(NSArray*)buttons {
    self = [super initWithFrame:CGRectMake(0, 0, self.window.rootViewController.view.bounds.size.width, 40)];
    if (self) {
        _buttonsToAdd = buttons;
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [self addSubview:[self inputAccessoryView]];
    }
    return self;
}

+ (void)addToTextView:(UITextView*)textView withButtons:(NSArray *)buttons {
    [RFToolbarButton setTextViewForButton:textView];
    RFKeyboardToolbar *keyboardToolbar = [[RFKeyboardToolbar alloc] initWithButtons:buttons];
    
    [textView setInputAccessoryView:keyboardToolbar];
}

+ (void)addToTextField:(UITextField *)textField withButtons:(NSArray *)buttons {
    [RFToolbarButton setTextFieldForButton:textField];
    RFKeyboardToolbar *keyboardToolbar = [[RFKeyboardToolbar alloc] initWithButtons:buttons];
    
    [textField setInputAccessoryView:keyboardToolbar];
}

- (void)layoutSubviews {
    CGRect frame = _toolbarView.bounds;
    frame.size.height = 0.5f;
    
    _topBorder.frame = frame;
}

- (UIView*)inputAccessoryView {
    _toolbarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 40)];
    _toolbarView.backgroundColor = [UIColor colorWithWhite:0.973 alpha:1.0];
    _toolbarView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    
    _topBorder = [CALayer layer];
    _topBorder.frame = CGRectMake(0.0f, 0.0f, self.bounds.size.width, 0.5f);
    _topBorder.backgroundColor = [UIColor colorWithWhite:0.678 alpha:1.0].CGColor;
    
    [_toolbarView.layer addSublayer:_topBorder];
    [_toolbarView addSubview:[self fakeToolbar]];
    
    return _toolbarView;
}

- (UIScrollView*)fakeToolbar {
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 40)];
    _scrollView.backgroundColor = [UIColor clearColor];
    _scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.contentInset = UIEdgeInsetsMake(6.0f, 7.0f, 7.0f, 6.0f);
    
    NSUInteger index = 0;
    NSUInteger originX = 0;
    
    CGRect originFrame;
    
    for (RFToolbarButton *eachButton in _buttonsToAdd) {
        originFrame = CGRectMake(originX, 0, eachButton.frame.size.width, eachButton.frame.size.height);
        eachButton.frame = originFrame;
        
        [_scrollView addSubview:eachButton];
        
        originX = originX + eachButton.bounds.size.width + 8;
        index++;
    }
    
    CGSize contentSize = _scrollView.contentSize;
    contentSize.width = originX - 8;
    _scrollView.contentSize = contentSize;
    
    return _scrollView;
}

@end
