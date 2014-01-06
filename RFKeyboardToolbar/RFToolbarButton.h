//
//  RFToolbarButton.h
//
//  Created by Rex Finn on 12/3/13.
//  Copyright (c) 2013 Rex Finn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RFKeyboardToolbar.h"

typedef void (^textFieldBlock)(UITextField *textField);
typedef void (^textViewBlock)(UITextView *textView);

@interface RFToolbarButton : UIButton

+(instancetype)buttonWithTitle:(NSString *)title;

-(void)setButtonPressedTextFieldBlock:(textFieldBlock)completionBlock;
-(void)setButtonPressedTextViewBlock:(textViewBlock)completionBlock;

@property (nonatomic, weak) UITextView *textView;
@property (nonatomic, weak) UITextField *textField;

@end
