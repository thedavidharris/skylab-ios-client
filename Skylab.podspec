Pod::Spec.new do |spec|

  spec.name         = "Skylab"
  spec.version      = "0.0.1"
  spec.summary      = "Skylab SDK"
  spec.license      = { :type => "MIT" }
  spec.author       = { "Amplitude" => "skylab@amplitude.com" }
  spec.platform     = :ios, "10.0"
  spec.source       = { :git => "https://github.com/amplitude/skylab-ios-client.git", :tag => "v#{spec.version}" }
  spec.dependency 'Amplitude'
end
