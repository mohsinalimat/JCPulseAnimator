#
#  Be sure to run `pod spec lint JCPulseAnimator.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "JCPulseAnimator"
  s.version      = "0.0.4"
  s.summary      = "Framework to display pulse and waves animations."
  s.description  = "Framework to display pulse and waves animations during a period of time or infinitely."

  s.homepage     = "https://github.com/jmcur/JCPulseAnimator.git"
  s.license      = "MIT"
  s.author             = { "Juan Curti" => "juancurti22@gmail.com" }
  s.platform     = :ios, "11.0"
  s.source       = { :git => "https://github.com/jmcur/JCPulseAnimator.git", :tag => "#{s.version}" }
  s.source_files  = "JCPulseAnimator/*.{h,m,swift}"
  s.exclude_files = "Classes/Exclude"
  s.swift_version = "4.2"

end
