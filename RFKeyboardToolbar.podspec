Pod::Spec.new do |s|
  s.name         = 'RFKeyboardToolbar'
  s.version      = '1.2'
  s.summary      = 'A flexible UIView and UIButton subclass to add customized buttons and toolbars to your UITextFields/UITextViews.'
  s.homepage     = 'https://github.com/ruddfawcett/RFKeyboardToolbar'
  s.license      = 'MIT'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Rudd Fawcett' => 'rudd.fawcett@gmail.com' }
  s.platform     = :ios, '7.0'
  s.source       = { :git => 'https://github.com/ruddfawcett/RFKeyboardToolbar.git', :tag => 'v1.2' }
  s.source_files  = 'RFKeyboardToolbar/*'
  s.requires_arc = true
end
