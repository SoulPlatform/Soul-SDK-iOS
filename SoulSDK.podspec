#
# Be sure to run `pod lib lint SoulSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "SoulSDK"
  s.version          = "0.1.3"
  s.summary          = "SOUL SDK for iOS 8+"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
Soul SDK description
                       DESC

  s.homepage         = "https://bitbucket.org/SoulPlatform/soul-ios-sdk"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Mikhail Shershnev" => "mshershnev.dev@gmail.com" }
  s.source           = { :git => "https://bitbucket.org/SoulPlatform/soul-ios-sdk.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/mshershnev'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'SoulSDK' => ['Pod/Assets/*.png']
  }

  #s.public_header_files = 'Pod/Classes/SoulSDK.h'
  #s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'EasyMapping', '~> 0.15.0'
  s.dependency 'AFNetworking', '~> 3.0'
  s.dependency 'PubNub', '~> 4.3.0'

end
