#
# Be sure to run `pod lib lint BSZoomGridScrollView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BSZoomGridScrollView'
  s.version          = '0.2.0'
  s.summary          = 'Tracking your touch, BSZoomGridScrollView zooms in subviews in the grid-style UIScrollView'

  s.description      = 'Boooooring grid-scrollview that is only good at zooming series of views continuously, tracking your touch..'

  s.homepage         = 'https://github.com/boraseoksoon/BSZoomGridScrollView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'boraseoksoon' => 'boraseoksoon@gmail.com' }
  s.source           = { :git => 'https://github.com/boraseoksoon/BSZoomGridScrollView.git', :tag => s.version.to_s }
  
  s.social_media_url = 'https://twitter.com/boraseoksoon'

  s.swift_version = '5.1'
  
  s.ios.deployment_target = '13.0'

  s.source_files = 'BSZoomGridScrollView/Classes/**/*'

  s.frameworks = 'UIKit'
end
