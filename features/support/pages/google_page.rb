class GooglePage
    @@url = $BASE_URL
    
    def initialize(driver)
        @driver = driver
    end

    def visit
        @driver.navigate.to @@url
    end

    def search(term)
        element = @driver.find_element(name: 'q')
        element.send_keys term
        element.submit
    end

    def results
        elements = @driver.find_elements(css: '[data-header-feature="0"]')
    end
end