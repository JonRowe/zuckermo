require "zuckermo/version"

unless defined?(Motion::Project::Config)
  raise "This file must be required within a RubyMotion project config (usually the Rakefile)."
end

require 'bubble-wrap'

Motion::Project::App.setup do |app|

  Dir.glob(File.join(File.dirname(__FILE__), '../motion/**/*.rb')).each do |file|
    app.files.unshift(file)
  end
  app.frameworks += ["Facebook", "Accounts"]

end
