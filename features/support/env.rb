require "selenium-webdriver"
require 'yaml'    

ENV['ENV'] ||= 'staging'
project_root = File.expand_path('../../..', __FILE__)
$BASE_URL = YAML.load_file(project_root + "/config/config.yml")[ENV['ENV']][:url]

ENV['BROWSER'] ||= 'chrome'
project_root = File.expand_path('../../..', __FILE__)
$BROWSER = YAML.load_file(project_root + "/config/cucumber.yml")[:browser]
$BROWSER = ENV['BROWSER']