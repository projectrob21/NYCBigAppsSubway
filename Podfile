# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'BigAppsSubway' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for BigAppsSubway

  pod 'SnapKit', '~> 3.0'
  pod 'GoogleMaps'

  end

  post_install do |installer|
      installer.pods_project.targets.each do |target|
          target.build_configurations.each do |config|
              config.build_settings['SWIFT_VERSION'] = '3.0'
              config.build_settings['ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES'] = 'NO'
          end
      end
  end