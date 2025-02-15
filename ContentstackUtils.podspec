Pod::Spec.new do |s|
s.name             = 'ContentstackUtils'
s.version          = '1.2.0'
s.summary          = 'Contentstack is a headless CMS with an API-first approach that puts content at the centre.'

s.description      = <<-DESC
Contentstack is a headless CMS with an API-first approach that puts content at the centre. It is designed to simplify the process of publication by separating code from content. 
In a world where content is consumed via countless channels and form factors across mobile, web and IoT. Contentstack reimagines content management by decoupling code from content. Business users manage content – no training or development required. Developers can create cross-platform apps and take advantage of a headless CMS that delivers content through APIs. With an architecture that’s extensible – but without the bloat of legacy CMS – Contentstack cuts down on infrastructure, maintenance, cost and complexity.
DESC

s.homepage         = 'https://www.contentstack.com/'
s.license          = { :type => 'MIT',:text => 'See https://www.contentstack.com/'}
s.author           = { 'Contentstack' => 'support@contentstack.io' }

s.source           = { :git => 'https://github.com/contentstack/contentstack-utils-swift.git', :tag => s.version.to_s }
s.social_media_url = 'https://twitter.com/Contentstack'
s.swift_version = '5.0'

s.ios.deployment_target = '10.1'
s.osx.deployment_target = '10.12'
s.tvos.deployment_target = "10.0"
s.watchos.deployment_target = "3.0"

s.source_files =  'Sources/**/*.{swift}'
s.framework = "Foundation"

s.xcconfig      = {
                    'HEADER_SEARCH_PATHS' => '$(SDKROOT)/usr/include/libxml2',
                    'OTHER_LDFLAGS' => '-lxml2'
                  }
end
