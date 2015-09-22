require 'rubygems'
require 'sinatra'

$:.unshift File.dirname(__FILE__)

require 'lib/service.rb'
run Sinatra::Application
