require 'pry'
require 'nokogiri'
require 'open-uri'
require 'bundler/setup'
Bundler.require

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/categories.sqlite"
)

require_all 'app'