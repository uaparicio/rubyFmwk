Before do
    @driver = Selenium::WebDriver.for :chrome
    google_page = GooglePage.new(@driver)
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