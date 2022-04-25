require "selenium-webdriver"
require 'yaml'    


$PROJECT_PATH = File.expand_path('../..', __dir__)

ENV['env'] ||= 'staging'
$BASE_URL = YAML.load_file($PROJECT_PATH + "/config/config.yml")[ENV['env']][:url]

$BROWSER = ENV['browser'] ||= 'chrome'

$PLATFORM = ENV['platform'] ||= 'local'
