# Uncomment the next line to define a global platform for your project

target 'PatriotRV' do
  platform :ios, '16.2'
  use_frameworks!

  # Pods for PatriotRV
  # Fix for crash until merged to CocoaMQTT #802
  pod 'CocoaAsyncSocket', :git => 'https://github.com/dauerr/CocoaAsyncSocket'
  pod 'CocoaMQTT', :git => 'https://github.com/dauerr/CocoaMQTT'
#  pod 'CocoaMQTT'

  target 'PatriotRVTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'PatriotRVUITests' do
    # Pods for testing
  end

end

target 'PatriotRVWatchApp' do
  platform :watchos, '9.1'
  use_frameworks!

  # Pods for PatriotRVWatchApp

end

target 'PatriotRvWatchWidgetExtension' do
  platform :watchos, '9.1'
  use_frameworks!

  # Pods for PatriotRvWatchWidgetExtension

end

target 'PatriotRvWidgetExtension' do
  platform :ios, '16.2'
  use_frameworks!

  # Pods for PatriotRvWidgetExtension

end
