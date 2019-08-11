#
# Be sure to run `pod lib lint ActionPicker.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ActionPicker'
  s.version          = '0.1.0'
  s.summary          = 'An interactive replication of iOS-style action sheets'

  s.description      = <<-DESC
ActionPicker is an interactive replication of iOS-style action sheets that are widely used across the system to setup AirPods, HomePod, etc.
                       DESC

  s.homepage         = 'https://github.com/Serg Krivoblotsky/ActionPicker'
   s.screenshots     = 'https://raw.githubusercontent.com/Krivoblotsky/ActionPicker/master/Screenshots/screenshot_1.png', 'https://raw.githubusercontent.com/Krivoblotsky/ActionPicker/master/Screenshots/screenshot_2.png'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Serg Krivoblotsky' => 'krivoblotsky@me.com' }
  s.source           = { :git => 'https://github.com/Krivoblotsky/ActionPicker.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/Krivoblotsky'

  s.swift_version = '5.0'
  s.ios.deployment_target = '11.0'

  s.source_files = 'ActionPicker/Classes/**/*'
  s.resources = 'ActionPicker/Assets/Resources/**/*.{xib,storyboard}'
  s.frameworks = 'UIKit'
end
