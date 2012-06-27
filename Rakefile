task :console do
  $: << File.expand_path("../lib", __FILE__)
  require 'netflix_gem_client'

  ARGV.clear
  require 'irb'
  IRB.start
end