require "selenium-webdriver"
require 'yaml'    

ENV['env'] ||= 'staging'
project_root = File.expand_path('../../..', __FILE__)
$BASE_URL = YAML.load_file(project_root + "/config/config.yml")[ENV['env']][:url]

$BROWSER = ENV['browser'] ||= 'chrome'