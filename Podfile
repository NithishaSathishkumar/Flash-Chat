# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

target 'Flash Chat iOS13' do
  use_frameworks!

  # Pods 'CLTypingLabel' for animation text
  pod 'CLTypingLabel', '~> 0.4.0' #delete this if you want to remove
  
  # Add the pods for the Firebase products you want to use in your app
  pod 'FirebaseAuth'# Firebase Authentication
  pod 'FirebaseFirestore'#Cloud Firestore

end
post_install do |installer|
 installer.pods_project.targets.each do |target|
  target.build_configurations.each do |config|
   config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
  end
 end
end
