require_relative './config/environment'
require 'sinatra/activerecord/rake'

def reload!
  load 'config/environment.rb'
end

desc 'Loads a console'
task :console do
  puts "### Welcome to BallotCLI Console ###"
  Pry.start
end

task :load do
  OscarScraper.new.call #=> "_site/101.htmls"
end