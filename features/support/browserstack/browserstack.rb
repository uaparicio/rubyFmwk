require 'yaml'    

class BrowserStack
    attr_accessor :capName
  
    @@build_name = Time.now.strftime("%Y%m%dT%H%M")
    @@bs_url = "#{ENV['BS_LOCAL_FOLDER_URL'].split('.')[0]}:#{ENV['BS_ACCESS_KEY']}@hub-cloud.browserstack.com/wd/hub"
    @@remoteDriver

    def initialize(capName, scenarioName)
        load_caps(capName, scenarioName)
        @@remoteDriver = Selenium::WebDriver.for(:remote,
            :url => @@bs_url,
            :capabilities => @@capabilities)    
    end

    def get_driver
        return @@remoteDriver
    end

    def load_caps(capName, scenarioName)
        caps = YAML.load_file("#{$PROJECT_PATH}/config/capabilities.yml")['capabilities'][capName]
        raise "#{capName} is not a defined capability" if caps.nil?

        @@capabilities = Selenium::WebDriver::Remote::Capabilities.new
        @@capabilities['javascriptEnabled'] = 'true'
        @@capabilities['os'] = caps['os']
        @@capabilities['os_version'] = caps['os_version']
        @@capabilities['browser'] = caps['browser']
        @@capabilities['browser_version'] = caps['browser_version']
        @@capabilities['name'] = scenarioName
        @@capabilities['build'] = capName + "_" + @@build_name
    end
end