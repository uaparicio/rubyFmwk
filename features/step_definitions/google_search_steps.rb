Given("I go to google") do
    @google = GooglePage.new(@driver)
    @google.visit
end

When("I search for {string}") do |term|
    @term = term
    @google.search term
end

Then("the results are correct") do
    @google.results.each do |n|
        expect(n.text.downcase).to include(@term.downcase)
    end
end