//
//  RFKeyboardToolbar.h
//
//  Created by Rex Finn on 12/3/13.
//  Copyright (c) 2013 Rex Finn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RFToolbarButton.h"

@interface RFKeyboardToolbar : UIView <UITextViewDelegate, UITextFieldDelegate>

@property (nonatomic,readwrite) id<UITextInput> textInput;

+(void)addToolbarTo:(id<UITextInput>)textInput withButtons:(NSArray*)buttons;

@end
