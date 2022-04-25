Before do
    @driver = Selenium::WebDriver.for :chrome
    google_page = GooglePage.new(@driver)
end

After do
    @driver.close
end