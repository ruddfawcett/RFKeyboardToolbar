RFKeyboardToolbar
=================

This is a flexible UIView and UIButton subclass to add customized buttons and toolbars to your UITextFields/UITextViews.  This project was inspired by the toolbar seen in [iOctocat](http://ioctocat.com).

##Installation

### Installation with CocoaPods (hasn't been added yet)

[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like RFKeyboardToolbar in your projects.

#### Podfile

```ruby
platform :ios, '7.0'
pod "RFKeyboardToolbar", "~> 1.0"
```

### Installation without CocoaPods

Just drag the RFKeyboardToolbar folder into your project and import it.

```
#import 'RFKeyboardToolbar.h'
// Also, import any RFToolbarButton subclasses you may have.
```

## Use

RFKeyboardToolbar is pretty easy to use with either you're UITextFields or UITextViews.  After you've imported `RFKeyboardToolbar`, you can add a toolbar to your UITextInput.  I've commented on the initialization below, to help you get a better understanding of it.

```obj-c
    RFExampleToolbarButton *exampleButton = [RFExampleToolbarButton new];
    // This is a RFToolbarButton subclass - you set the button title and the button's target in this subclass
    // You then import the subclass, and then alloc and init it with new
    
    _textView = [[UITextView alloc] initWithFrame:self.view.bounds];
    // The underscore is to access the UITextView variable set in the @interface (you can see this in the demo)
    
    [RFKeyboardToolbar addToTextView:_textView withButtons:@[exampleButton]];
    // Here's where the new magic happens (previously you could use UITextInput, and not have to worry about adding it for a UITextView/UIToolbar)**
    // The array is the arry of buttons you created and have "newed" above.  They will appear in the order you
    // add them from left to right.  You can access the textfield/view in the button subclasses to insert text
    // or do whatever you want via [RFToolbarButton textInput].  But you can see this in the example as well.
    
    // ** while working on RFMarkdownTextView, I realized that UITextInput is much less documented, and this isn't that much different, so I went with this.
    
    [self.view addSubview:_textView];
    // Add the textview and enjoy!
```

Hope you enjoy it!  Please Fork and send Pull Requests!

##Screenshots

![RFMarkdownTextView](http://i.imgur.com/NEAocbW.png)
![RFKeyboardToolbarDemo](http://i.imgur.com/LvD0GqC.png)

##License

The MIT License (MIT)

Copyright (c) 2013 Rex Finn

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
