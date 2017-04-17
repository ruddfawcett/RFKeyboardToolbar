RFKeyboardToolbar<br /> [![RFGravatarImageView Version](http://img.shields.io/cocoapods/v/RFKeyboardToolbar.svg?style=flat)](http://cocoadocs.org/docsets/RFGravatarImageView/1.1/) ![License MIT](http://img.shields.io/badge/license-MIT-orange.svg?style=flat) ![reposs](https://reposs.herokuapp.com/?path=ruddfawcett/RFKeyboardToolbar&style=flat)
====================
This is a flexible UIView and UIButton subclass to add customized buttons and toolbars to your UITextFields/UITextViews.  This project was inspired by the toolbar seen in [iOctocat](http://ioctocat.com).

## Installation

### Installation with CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like RFKeyboardToolbar in your projects.

#### Podfile

```ruby
platform :ios, '7.0'
pod "RFKeyboardToolbar", "~> 1.3"
```

### Installation without CocoaPods

Just drag the RFKeyboardToolbar folder into your project and import it.

```obj-c
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
    // Do anything in this block here
    [_textView insertText:@"You pressed a button!"];
} forControlEvents:UIControlEventTouchUpInside];

// Create an RFKeyboardToolbar, adding all of your buttons, and set it as your inputAcessoryView
_textView.inputAccessoryView = [RFKeyboardToolbar toolbarWithButtons:@[exampleButton]];

// Add the UITextView/UITextField
[self.view addSubview:_textView];
```

Hope you enjoy it!  Please Fork and send Pull Requests!

## Screenshots

![RFMarkdownTextView](http://i.imgur.com/NEAocbW.png)

## Contributors
- [Rudd Fawcett (@ruddfawcett)] (https://github.com/ruddfawcett) - Creator
- [Brandon Butler (@Hackmodford)] (https://github.com/Hackmodford)
- [Jesús A. Álvarez (@zydeco)] (https://github.com/zydeco)

## License

RFKeyboardToolbar is available under the MIT license. See the LICENSE file for more info.
