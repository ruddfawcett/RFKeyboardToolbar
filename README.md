RFKeyboardToolbar
=================

This is a flexible UIView and UIButton subclass to add customized buttons and toolbars to your UITextFields/UITextViews.  This project was inspired by the toolbar seen in [iOctocat](http://ioctocat.com).

##Installation

### Installation with CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like RFKeyboardToolbar in your projects.

#### Podfile

```ruby
platform :ios, '7.0'
pod "RFKeyboardToolbar", "~> 1.3"
```

### Installation without CocoaPods

Just drag the RFKeyboardToolbar folder into your project and import it.

```
#import 'RFKeyboardToolbar.h'
```

## Use

RFKeyboardToolbar is pretty easy to use with your UITextFields or UITextViews.  After you've imported `RFKeyboardToolbar`, you can add a toolbar to anything that has an inputAccessoryView.  

I've commented on the initialization below, to help you get a better understanding of it.

```obj-c
// Create a new RFToolbarButton
RFToolbarButton *exampleButton = [RFToolbarButton buttonWithTitle:@"Example"];

// Add a button target to the exampleButton
[exampleButton addEventHandler:^{
    // Add any action
    [_textView insertText:@"You pressed a button!"];
} forControlEvents:UIControlEventTouchUpInside];

// Create an RFKeyboardToolbar, adding all of your buttons, and set it as your inputAcessoryView
_textView.inputAccessoryView = [RFKeyboardToolbar toolbarWithButtons:@[exampleButton]];

// Add the UITextView/UITextField
[self.view addSubview:_textView];
```

Hope you enjoy it!  Please Fork and send Pull Requests!

##Screenshots

![RFMarkdownTextView](http://i.imgur.com/NEAocbW.png)
![RFKeyboardToolbarDemo](http://i.imgur.com/LvD0GqC.png)

##Contributors
- [Rudd Fawcett (@ruddfawcett)] (https://github.com/ruddfawcett) - Creator
- [Brandon Butler (@Hackmodford)] (https://github.com/Hackmodford) - Heavy Contributor (Version 1.1)
- [Jesús A. Álvarez (@zydeco)] (https://github.com/zydeco) - Contributor

##License

The MIT License (MIT)

Copyright (c) 2015 Rudd Fawcett

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
