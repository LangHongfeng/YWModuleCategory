Pod::Spec.new do |s|
  s.name         = "YWModuleCategory"
  s.version      = "0.0.1"
  s.ios.deployment_target = '8.0'
  s.summary      = "简介"
  s.homepage     = "https://github.com/LangHongfeng/YWModuleCategory"
  s.social_media_url = 'https://www.baidu.com'
  s.license      = "MIT"
  # s.license    = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author       = { "Langhongfeng" => "lh86771632@163.com" }
  s.source       = { :git => 'https://github.com/LangHongfeng/YWModuleCategory.git', :tag => s.version}
  s.requires_arc = true
  s.source_files = 'Classes/LimitInput/*','Classes/NSArray/*','Classes/NSObject/*','Classes/NSString/*','Classes/NSTimer/*','Classes/UIButton/*','Classes/UIColor/*','Classes/UIControl/*','Classes/UIImage/*','Classes/UIImageView/*','Classes/UILabel/*','Classes/UITableView/*','Classes/UIView/*','Classes/UIViewController/*'

  s.dependency 'SDAutoLayout'
  #s.public_header_files = 'runtime/TFRuntimeManager.h'
  s.frameworks = 'UIKit'
end