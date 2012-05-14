$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'
require 'motion-cocoapods'
Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'ToDo'

  # Dependencies for NanoStore
  app.files = Dir.glob(File.join(app.project_dir, 'vendor/BubbleWrap/lib/**/*.rb')) + app.files
  app.files = Dir.glob(File.join(app.project_dir, 'vendor/NanoStoreInMotion/lib/**/*.rb')) + app.files
  app.pods do
    dependency 'NanoStore'
  end
end
