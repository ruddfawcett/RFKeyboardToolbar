Pod::Spec.new do |s|
  s.name         = 'RFKeyboardToolbar'
  s.version      = '1.3'
  s.summary      = 'A flexible UIView and UIButton subclass to add customized buttons and toolbars to your UITextFields/UITextViews.'
  s.homepage     = 'https://github.com/ruddfawcett/RFKeyboardToolbar'
  s.license      = 'MIT'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Rudd Fawcett' => 'rudd.fawcett@gmail.com' }
  s.social_media_url = 'https://twitter.com/ruddfawcett'
  s.platform     = :ios, '7.0'
  s.source       = { :git => 'https://github.com/ruddfawcett/RFKeyboardToolbar.git', :tag => 'v1.3' }
  s.source_files  = 'RFKeyboardToolbar/*'
  s.requires_arc = true
end
