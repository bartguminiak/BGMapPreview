Pod::Spec.new do |s|
  s.name             = 'BGMapPreview'
  s.version          = '1.1.7'
  s.summary          = 'BGMapPreview is a category on UIImageView for iOS to create and set map preview image asynchronously.'

  s.homepage         = 'https://github.com/bartguminiak/BGMapPreview'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'bartguminiak' => 'guminiak.bartlomiej@gmail.com' }
  s.source           = { :git => 'https://github.com/bartguminiak/BGMapPreview.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/bartgum'

  s.ios.deployment_target = '8.0'

  s.source_files = 'BGMapPreview/Classes/**/*'

#s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'MapKit'

end
