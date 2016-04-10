require 'rspec'
require 'pry'
require File.expand_path '../../classes/universal_translator.rb', __FILE__
require File.expand_path '../../custom_translators/day_to_hiragana_translator.rb', __FILE__
require File.expand_path '../../classes/handbook.rb', __FILE__

ENV['RACK_ENV'] = 'test'
