require 'bundler'
require 'csv'
Bundler.require


$:.unshift File.expand_path("./../lib", __FILE__)

require_relative 'lib/controller'
require_relative 'lib/gossip'
require_relative 'lib/router'
require_relative 'lib/view'

Router.new.perform