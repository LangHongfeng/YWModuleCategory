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
  s.source_files = 'Pods/GVUserDefault/*','Pods/LimitInput/*','Pods/NSArray/*','Pods/NSObject/*','Pods/NSString/*','Pods/NSTimer/*','Pods/UIButton/*','Pods/UIColor/*','Pods/UIControl/*','Pods/UIImage/*','Pods/UIImageView/*','Pods/UILabel/*','Pods/UITableView/*','Pods/UIView/*','Pods/UIViewController/*'
  s.dependency 'GVUserDefaults'
  s.dependency 'SDAutoLayout'
  #s.public_header_files = 'runtime/TFRuntimeManager.h'

end