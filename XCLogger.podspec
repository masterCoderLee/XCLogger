Pod::Spec.new do |spec|

    spec.name = 'XCLogger'
    spec.version = '0.0.1'
    spec.summary = 'A debug log module for use in Swift projects.'

    spec.description = <<-DESC
                        Allows you to log details to the console (and optionally a file), just like you would have with NSLog() or print(), but with additional information, such as the date, function name, filename and line number.
                        DESC

    spec.homepage = 'https://github.com/masterCoderLee/XCLogger.git'

    spec.license = { :type => 'MIT', :file => 'LICENSE.txt' }
    spec.author = { 'xiaobing' => 'xiaobingli92@163.com' }
    spec.social_media_url = 'https://mastodon.social/@davewoodx'
    spec.platforms = { :ios => '12.0', :watchos => '4.0', :tvos => '12.0', :osx => '10.13' }
    spec.requires_arc = true
    spec.pod_target_xcconfig = { 'SWIFT_VERSION' => '5.0' }
    spec.swift_version = '5.0'
    spec.cocoapods_version = '>= 1.13.0'

    spec.source = { :git => 'https://github.com/masterCoderLee/XCLogger.git', :tag => "#{spec.version}" }

    spec.ios.deployment_target = '12.0'
    spec.osx.deployment_target = '10.13'
    spec.watchos.deployment_target = '4.0'
    spec.tvos.deployment_target = '12.0'

    spec.default_subspecs = 'Core'

    # Main XCLogger Framework
    spec.subspec 'Core' do |core|
        core.dependency 'ObjcExceptionBridging'
        core.source_files = 'Sources/XCLogger/**/*.{swift}'
        core.exclude_files = 'Sources/XCLogger/**/Optional/*.{swift}'
        core.resource_bundles = {
            "#{spec.name}" => [
            	'Sources/XCLogger/PrivacyInfo.xcprivacy',
            ]
        }        
    end

    # An experimental subspec to include helpers for using the UserInfo dictionary with log messages, tagging logs with tags and/or developers
    spec.subspec 'UserInfoHelpers' do |userinfohelpers|
        userinfohelpers.dependency 'XCLogger/Core'
        userinfohelpers.source_files = 'Sources/XCLogger/Misc/Optional/UserInfoHelpers.swift'
    end
end
