//
//  RFKeyboardToolbar.h
//
//  Created by Rex Finn on 12/3/13.
//  Copyright (c) 2013 Rex Finn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RFToolbarButton.h"

@interface RFKeyboardToolbar : UIView <UITextViewDelegate, UITextFieldDelegate>

+(void)addToTextView:(UITextView*)textView withButtons:(NSArray*)buttons;
+(void)addToTextField:(UITextField*)textField withButtons:(NSArray*)buttons;

@end
