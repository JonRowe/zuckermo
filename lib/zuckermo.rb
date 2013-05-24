require "zuckermo/version"

unless defined?(Motion::Project::Config)
  raise "This file must be required within a RubyMotion project config (usually the Rakefile)."
end

require 'bubble-wrap'

Motion::Project::App.setup do |app|

  root = File.join( File.dirname(__FILE__), '../motion' )
  zuckermo_files = Dir.glob root+'/**/*.rb'

  %W[#{root}/pollute.rb #{root}/facebook.rb #{root}/zuckermo.rb] + zuckermo_files.each do |file|
    app.files.unshift(file)
  end
  app.weak_frameworks += ["Social","Accounts"]

end
