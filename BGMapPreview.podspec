Pod::Spec.new do |s|
  s.name             = "BGMapPreview"
  s.version          = "1.0.1"
  s.summary          = "BGMapPreview is a category on UIImageView for iOS to create and set map preview image asynchronously."
  s.homepage         = "https://github.com/bartguminiak/BGMapPreview"
  s.license          = 'MIT'
  s.author           = { "Bartlomiej Guminiak" => "guminiak.bartlomiej@gmail.com" }
  s.source           = { :git => "https://github.com/bartguminiak/BGMapPreview.git", :tag => "v1.0.1" }
  s.social_media_url = 'https://twitter.com/bartgum'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'BGMapPreview' => ['Pod/Assets/*.png']
  }
  s.frameworks = 'UIKit', 'MapKit'
end
