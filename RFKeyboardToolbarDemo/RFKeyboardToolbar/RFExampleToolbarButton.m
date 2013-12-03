//
//  RFExampleToolbarButton.m
//
//  Created by Rudd Fawcett on 12/3/13.
//  Copyright (c) 2013 Rex Finn. All rights reserved.
//

#import "RFExampleToolbarButton.h"

@implementation RFExampleToolbarButton

- (NSString*)titleForButton {
    return @"Example";
}

- (void)buttonTarget {
    [[RFToolbarButton textInput] insertText:@"Example text."];
}

@end
