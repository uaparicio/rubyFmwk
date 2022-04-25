Before do |scenario|
    if ENV['platform'] == 'local'
        case $BROWSER
        when 'firefox'
            @driver = Selenium::WebDriver.for :firefox
        when 'safari'
            @driver = Selenium::WebDriver.for :safari
        when 'edge'
            @driver = Selenium::WebDriver.for :edge
        when 'chrome'
            @driver = Selenium::WebDriver.for :chrome
        else
            raise "#{$BROWSER} is not a defined browser"
        end
    else
        @driver = BrowserStack.new($BROWSER, scenario.name).get_driver
    end
end

After do |scenario|
    if scenario.failed?
        @driver.save_screenshot('./report/screenshot.png')
        attach("./report/screenshot.png", "image/png")
        msg = scenario.exception.message.gsub("\"", "'").split("Diff:")[0]
        script = "browserstack_executor: {\"action\": \"setSessionStatus\", \"arguments\": {\"status\":\"failed\"}}" #, \"reason\": \"#{msg}\"}}"
        @driver.execute_script(script) if ENV['platform'] == 'bs'
    else
        @driver.execute_script('browserstack_executor: {"action": "setSessionStatus", "arguments": {"status":"passed"}}') if ENV['platform'] == 'bs'
    end
    @driver.quit
end

AfterAll do 
    # system("open -a 'google chrome' ./report/report.html")
end