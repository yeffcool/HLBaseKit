Pod::Spec.new do |s|
  s.name         = "HLBaseKit"
  s.version      = "0.0.2"
  s.summary      = "This is a UI & Datas framework for IOS."

  s.description  = <<-DESC
                   Controller UI, Cell, View, etc. for the two packages, the basic data for operations, such as data conversion, image processing, date processing, data encryption, etc., to join the skin management tool, can more easily manage UI skin.
                   DESC
  s.homepage     = "https://github.com/yeffcool/HLBaseKit"
  s.license      = "MIT"
  s.authors      = { "Hanks Han" => "524503467@qq.com" }
  s.source       = { :git => "https://github.com/yeffcool/HLBaseKit.git", :tag => s.version.to_s }
  s.frameworks   = 'Foundation', 'UIKit'
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.source_files = "HKBaseKit/NSBase/**/*.{h,m}", "HKBaseKit/UIBase/UIController/**/*.{h,m}", "HKBaseKit/UIBase/UISkin/**/*.{h,m}", "HKBaseKit/UIBase/UIView/**/*.{h,m}"
  s.resources    = "HKBaseKit/Resources/*.png", "HLBaseKit/Resources/*.png"
  s.dependency 'pop', '~> 1.0.8'
end
