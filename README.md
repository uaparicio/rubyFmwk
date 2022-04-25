# Ruby automation framework

### Make it work

1. Make sure you are running ruby 3.1.2 
2. Download [the right version of chromedriver](https://chromedriver.chromium.org/downloads) to your local and move it to a path included in your system PATH environment variable (or add its path to $PATH)
3. run `gem install bundler`
4. run `bundler install`

### Running the tests
Run `bundle exec cucumber -p regression` to run the tests with the regression profile (check other profiles in `config/cucumber.yml`)

##### Optional parameters:
| Param | Options | Default |
| ----------- | ----------- | ----------- |
| env | staging \| production | staging|
| browser | chrome \| firefox \| safari \| edge \| bs | chrome |

*Note: If you want to run the tests against Browserstack you should get the following values from your browserstack account and run:*
- `export BS_LOCAL_FOLDER_URL=<yourBSLocalFolderUrl>`
- `export BS_ACCESS_KEY=<yourBSAccessKey>`