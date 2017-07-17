Pod::Spec.new do |s|
  s.name         = "DMNetworking"
  s.version      = "1.0.1"
  s.summary      = "针对项目的网络请求进行AFN的封装。"
  s.description  = <<-DESC
                        缓存、加解密
                   DESC
  s.homepage     = "https://github.com/YRDGroup/DMNetWorking"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Agoer" => "https://github.com/Agoer" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/YRDGroup/DMNetWorking.git",  :branch => "master", :tag => "1.0.0" }
  s.source_files  = "DMNetworking", "DMNetworking/**/*.{h,m}"
  s.requires_arc = true
  s.dependency "AFNetworking"
  s.dependency "Mantle"
  s.dependency "MJExtension"
  s.dependency "YYModel"
  s.dependency "JSONModel"
end