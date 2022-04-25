class GooglePage
    include PageObject

    def initialize(driver)
        @driver = driver
    end

    def visit
        @driver.navigate.to 'http://google.com'
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