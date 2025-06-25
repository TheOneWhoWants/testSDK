Pod::Spec.new do |spec|
  spec.name                       = 'ExampleSDK'
  spec.version                    = '1.0.1'
  spec.homepage                   = 'https://github.com/growthbook/growthbook-swift'
  spec.documentation_url          = 'https://docs.growthbook.io'
  spec.license                    = 'https://opensource.org/licenses/MIT'
  spec.author                     = { 'testAuthor' => 'anotherd423@gmail.com' }
  spec.summary                    = 'Powerful A/B testing SDK for Swift - iOS'
  spec.source                     = { :http => "https://github.com/TheOneWhoWants/testSDK/archive/refs/heads/main.zip" }
  
  spec.vendored_frameworks        = "build/GrowthBook.xcframework"

  spec.swift_version              = ['5.0', '5.1', '5.2']
  spec.ios.deployment_target      = '12.0'
  spec.watchos.deployment_target  = '5.0'
  spec.tvos.deployment_target     = '12.0'
  spec.osx.deployment_target      = '10.15'
  spec.visionos.deployment_target = '1.0'

  spec.pod_target_xcconfig        = { 'DEFINES_MODULE' => 'YES' }

  spec.swift_version = '5.2'

end