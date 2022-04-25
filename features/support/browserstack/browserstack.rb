class BrowserStack
  
    @@capabilities = Selenium::WebDriver::Remote::Capabilities.new
    @@bs_url = "#{ENV['BS_LOCAL_FOLDER_URL'].split('.')[0]}:#{ENV['BS_ACCESS_KEY']}@hub-cloud.browserstack.com/wd/hub"
    @@remoteDriver

    def initialize
        load_caps()
        @@capabilities['javascriptEnabled'] = 'true'
        @@remoteDriver = Selenium::WebDriver.for(:remote,
            :url => @@bs_url,
            :capabilities => @@capabilities)    
    end

    def get_driver
        return @@remoteDriver
    end

    def load_caps
        @@capabilities["os"] = "OS X"
        @@capabilities['browser'] = 'chrome'
        @@capabilities['browser_version'] = 'latest'
        @@capabilities['os'] = 'Windows'
        @@capabilities['os_version'] = '10'
        @@capabilities['name'] = 'scenario'
        @@capabilities['build'] = 'browserstack-build-15'
    end
end