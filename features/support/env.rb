require "selenium-webdriver"
require "allure-cucumber"

AllureCucumber.configure do |config|
    config.results_directory = "report/allure-results"
    config.clean_results_directory = true
    config.logging_level = Logger::INFO
    config.logger = Logger.new($stdout, Logger::INFO)
end