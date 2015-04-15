Pod::Spec.new do |s|
  s.name         = "HeaderTableViewController"
  s.version      = "0.1"
  s.summary      = "TableViewController with flexible top viewcontroller"
  s.description  = "Add any custom viewcontroller on the top of your table view with flexible sizing when stretching the top"
  s.homepage     = "https://github.com/intonarumori/HeaderTableViewController"
  s.license      = { :type => 'MIT', :file => 'LICENSE.txt' }
  s.author       = { "Daniel Langh" => "intonarumori@gmail.com" }
  s.source       = { :git => "https://github.com/intonarumori/HeaderTableViewController", :tag => "v0.1" }
  s.platform     = :ios, '7.0'

  s.source_files = 'HeaderTableViewController/*.{h,m}'
  s.requires_arc = true
  s.frameworks   = [ "UIKit" ]
end