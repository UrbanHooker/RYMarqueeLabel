Pod::Spec.new do |s|
  s.name         = "RYMarqueeLabel"
  s.version      = "1.0.1"
  s.summary      = "A UILabel with marquee effect"
  s.homepage     = "http://dreamwithroy.com"
  s.license      = "MIT"
  s.authors      = { 'urbanhooker' => 'urbanhooker@163.com'}
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/UrbanHooker/RYMarqueeLabel.git", :tag => s.version }
  s.source_files = 'RYMarqueeLabel/*'
  s.requires_arc = true
end