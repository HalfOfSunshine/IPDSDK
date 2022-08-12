#
# Be sure to run `pod lib lint IPDSDK_Pods.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'IPDSDK'
  s.version          = '0.1.0'
  s.summary          = 'IPDSDK广告'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/HalfOfSunshine/IPDSDK'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Mountain King' => '1054293440@qq.com' }
  s.source           = { :git => 'https://github.com/HalfOfSunshine/IPDSDK.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  s.ios.deployment_target = '10.0'
  s.platform     = :ios, "10.0"
  
  #依赖的系统frameworks
  s.frameworks = 'UIKit','Foundation','StoreKit','MobileCoreServices','WebKit','MediaPlayer','CoreMedia','CoreLocation','AVFoundation','CoreTelephony','SystemConfiguration','AdSupport','CoreMotion','Accelerate','QuartzCore','Security','ImageIO'
  
  #依赖的系统静态库
  #z表示libz.tdb,后缀不需要,lib开头的省略lib
  s.libraries = 'resolv.9','c++','z','sqlite3','bz2','xml2','c++abi'
  s.pod_target_xcconfig = { 'VALID_ARCHS' => 'x86_64 armv7 arm64' }
  
#  valid_archs = ['armv7', 'i386', 'x86_64', 'arm64']
#  s.pod_target_xcconfig = {
#    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
#  }
#  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  s.default_subspecs = 'IPDSDKModuleGDT', 'IPDSDKModuleCSJ', 'IPDSDKModuleKS', 'IPDSDKModuleMTG', 'IPDSDKModuleDSP','IPDSDKModuleSIG','IPDSDKModuleBD'

  s.subspec 'IPDAdSDK' do |ss|
    ss.vendored_frameworks = 'IPDSDK/IPDAdSDK/*.framework'
    ss.preserve_paths = 'IPDSDK/IPDAdSDK/*.framework'
  end
  
  s.subspec 'IPDSDKModuleGDT' do |ss|
    ss.vendored_libraries = 'IPDSDK/IPDSDKModuleGDT/*.a'
    ss.dependency 'IPDSDK/IPDAdSDK'
    ss.dependency 'GDTMobSDK', '~> 4.13'
  end

  s.subspec 'IPDSDKModuleCSJ' do |ss|
    ss.vendored_libraries = 'IPDSDK/IPDSDKModuleCSJ/*.a'
    ss.dependency 'IPDSDK/IPDAdSDK'
    ss.dependency 'Ads-CN-Beta', '~>4.7'
  end

  s.subspec 'IPDSDKModuleKS' do |ss|
    ss.vendored_libraries = 'IPDSDK/IPDSDKModuleKS/*.a'
    ss.dependency 'IPDSDK/IPDAdSDK'
#    ss.vendored_frameworks = 'IPDSDK/IPDSDKModuleKS/KSAdSDK.framework'
    ss.dependency 'KSAdSDK', '~> 3.3'
  end

  s.subspec 'IPDSDKModuleMTG' do |ss|

    ss.vendored_libraries = 'IPDSDK/IPDSDKModuleMTG/*.a'
    ss.dependency 'IPDSDK/IPDAdSDK'
    ss.dependency 'MintegralAdSDK', '~> 7.0'
    ss.dependency 'MintegralAdSDK/RewardVideoAd'
    ss.dependency 'MintegralAdSDK/BannerAd'
    ss.dependency 'MintegralAdSDK/SplashAd'
    ss.dependency 'MintegralAdSDK/InterstitialAd'
    ss.dependency 'MintegralAdSDK/NativeAdvancedAd'
  end

  s.subspec 'IPDSDKModuleDSP' do |ss|
    ss.vendored_libraries = 'IPDSDK/IPDSDKModuleDSP/*.a'
    ss.resource = 'IPDSDK/IPDSDKModuleDSP/*.bundle'
    ss.dependency 'IPDSDK/IPDAdSDK'
  end
  
  s.subspec 'IPDSDKModuleSIG' do |ss|
    ss.vendored_libraries = 'IPDSDK/IPDSDKModuleSIG/*.a'
    ss.dependency 'IPDSDK/IPDAdSDK'
    ss.dependency 'SigmobAd-iOS', '~> 3.4.3'
  end

  s.subspec 'IPDSDKModuleYM' do |ss|
    ss.vendored_libraries = 'IPDSDK/IPDSDKModuleYM/*.a'
    ss.dependency 'IPDSDK/IPDAdSDK'
    ss.vendored_frameworks = 'IPDSDK/IPDSDKModuleYM/*.framework'
    ss.preserve_paths = 'IPDSDK/IPDSDKModuleYM/*.framework'
    ss.resources = 'IPDSDK/IPDSDKModuleYM/AlicloudCloudCode.framework/AlicloudCloudCode.bundle'
  end
  
  s.subspec 'IPDSDKModuleGoogle' do |ss|
    ss.vendored_libraries = 'IPDSDK/IPDSDKModuleGoogle/*.a'
    ss.source_files       = 'IPDSDK/IPDSDKModuleGoogle/*.h'
    ss.dependency 'IPDSDK/IPDAdSDK'
    ss.dependency 'Google-Mobile-Ads-SDK'
  end
 
 s.subspec 'IPDSDKModuleBD' do |ss|
   ss.vendored_libraries = 'IPDSDK/IPDSDKModuleBD/*.a'
   ss.dependency 'IPDSDK/IPDAdSDK'
   ss.dependency 'BaiduMobAdSDK'
 end
end
