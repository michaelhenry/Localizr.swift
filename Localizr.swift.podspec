#
# Be sure to run `pod lib lint Localizr.swift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Localizr.swift'
  s.version          = ENV["LOCALIZR_SWIFT_VERSION"] || '1.0.0'
  s.summary          = 'An iOS library that simplies the Localization process.'

  s.description      = <<-DESC
An iOS library that simplies the Localization process. 
It\'s recommended to use Localizr server (https://github.com/michaelhenry/Localizr) so that the localization process can be automated and can be done by different translators.
                       DESC

  s.homepage         = 'https://github.com/michaelhenry/Localizr.swift'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Michael Henry Pantaleon' => 'me@iamkel.net' }
  s.source           = { :git => 'https://github.com/michaelhenry/Localizr.swift.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
  s.source_files = 'Localizr.swift/Classes/**/*'
  s.swift_version = '4.1'
end
