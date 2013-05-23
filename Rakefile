$:.unshift("/Library/RubyMotion/lib")
require 'dotenv'
Dotenv.load

require 'motion/project/template/ios'
require "bundler/gem_tasks"

$:.unshift("./lib/")
require './lib/zuckermo'

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'Zuckermo'
  app.identifier = 'com.zuckermo.test'
  app.info_plist['APP_ID'] = ENV['APP_ID']
end
