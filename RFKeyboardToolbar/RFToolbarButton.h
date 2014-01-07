//
//  RFToolbarButton.h
//
//  Created by Rex Finn on 12/3/13.
//  Copyright (c) 2013 Rex Finn. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^buttonPressBlock)();

@interface RFToolbarButton : UIButton

+ (instancetype)buttonWithTitle:(NSString *)title;

- (void)setButtonPressedBlock:(buttonPressBlock)completionBlock forControlEvents:(UIControlEvents)controlEvent;

@end
