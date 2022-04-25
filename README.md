# Ruby automation framework

In order to make it work:

1 - Make sure you are running ruby 3.1.2 
2 - Download [the right version of chromedriver](https://chromedriver.chromium.org/downloads) to your local and move it to a path included in your system PATH environment variable (or add its path to $PATH)
3 - run `gem install bundler`
4 - run `bundler install`
5 - run `bundle exec cucumber` to run the tests