#
#  Be sure to run `pod spec lint CGCommonTools.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

spec.name         = "CGCommonTools"
spec.version      = "2.0.2"
spec.summary      = "一键封装开发基础工具类"
spec.description  = <<-DESC
                    封装一些开发基础工具类，如base基类，常用类别以及网络请求封装
                DESC

spec.homepage     = "https://github.com/chenhde/CGCommonTools"

spec.license      = "MIT"

spec.author             = { "Chenhde" => "669775990@qq.com" }

spec.source       = { :git => "https://github.com/chenhde/CGCommonTools.git", :tag => "#{spec.version}" }

spec.platform     = :ios, "10.0"
spec.ios.deployment_target = "10.0"
spec.ios.frameworks = 'Foundation', 'UIKit'
spec.requires_arc = true

spec.source_files  ="CGCommonTools","CGCommonTools/*.{h,m}"

spec.subspec 'Base' do |bas|

bas.source_files = "CGCommonTools/Base/*.{h,m}"


end
spec.subspec 'Categories' do |cat|

cat.source_files = "CGCommonTools/Categories/**/*.{h,m}"


end







end

