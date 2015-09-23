require 'rubygems'
require 'bundler'

Bundler.require

$:.unshift File.dirname(__FILE__)

require 'lib/service.rb'
run Sinatra::Application
