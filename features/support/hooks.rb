Before do
    case $BROWSER
    when 'firefox'
        @driver = Selenium::WebDriver.for :firefox
    when 'safari'
        @driver = Selenium::WebDriver.for :safari
    when 'edge'
        @driver = Selenium::WebDriver.for :edge
    when 'bs'
        bs = BrowserStack.new
        @driver = bs.get_driver
    else
        @driver = Selenium::WebDriver.for :chrome
    end
end

After do |scenario|
    if scenario.failed?
        @driver.save_screenshot('./report/screenshot.png')
        attach("./report/screenshot.png", "image/png")
        msg = scenario.exception.message.gsub("\"", "'").slice(0..(scenario.exception.message.index('Diff:')-2))
        script = "browserstack_executor: {\"action\": \"setSessionStatus\", \"arguments\": {\"status\":\"failed\", \"reason\": \"#{msg}\"}}"
        @driver.execute_script(script) unless $BROWSER != 'bs'
    else
        @driver.execute_script('browserstack_executor: {"action": "setSessionStatus", "arguments": {"status":"passed"}}') unless $BROWSER != 'bs'
    end
    @driver.quit
end

AfterAll do 
    # system("open -a 'google chrome' ./report/report.html")
end