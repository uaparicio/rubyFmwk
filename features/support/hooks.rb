Before do
    case $BROWSER
    when 'firefox'
        @driver = Selenium::WebDriver.for :firefox
    when 'safari'
        @driver = Selenium::WebDriver.for :safari
    when 'edge'
        @driver = Selenium::WebDriver.for :edge
    else
        @driver = Selenium::WebDriver.for :chrome
    end
end

After do |scenario|
    if scenario.failed?
        @driver.save_screenshot('./report/screenshot.png')
        attach("./report/screenshot.png", "image/png")
    end
    @driver.close
end

AfterAll do 
    # system("open -a 'google chrome' ./report/report.html")
end