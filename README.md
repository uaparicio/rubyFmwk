# Ruby automation framework

In order to make it work:

1. Make sure you are running ruby 3.1.2 
2. Download [the right version of chromedriver](https://chromedriver.chromium.org/downloads) to your local and move it to a path included in your system PATH environment variable (or add its path to $PATH)
3. run `gem install bundler`
4. run `bundler install`

Running the tests:
run `bundle exec cucumber -p regression` to run the tests with the regression profile (check in `config/cucumber.yml`)

Optional parameters:
| Param | Options | Default |
| ----------- | ----------- | ----------- |
| ENV | staging \| production | staging|
| BROWSER | chrome \| firefox \| safari | chrome|