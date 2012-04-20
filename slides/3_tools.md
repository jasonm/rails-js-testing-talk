# 3/4: Tools and examples

* Writing integration tests
* Writing isolation tests
* Running your tests

# Presenter Notes

---
# Writing integration tests
* `capybara`
# TODO: Example of capybara request spec
# Presenter Notes

---
# Writing Rails isolation tests

* `RSpec`
* `factory_girl`
* `mocha`

# Presenter Notes

* TODO: Example code of rspec, factory_girl, mocha

---
# Writing isolation tests

* From: Phil Sarin, [Making JavaScript Unit Testing Work](http://4cupsr.us/blog/2011/9/12/making-javascript-unit-testing-work-part-1-what-matters.html)
    * Ease of writing readable tests
    * Mocking
    * DRY fixtures
    * Continuous integration
    * Support for your favorite debugging tools
    * Support for your backend
    * Cross-browser compatibility

---
# Writing JavaScript isolation tests

* [jasmine](http://pivotal.github.com/jasmine/)
    * [jasmine-gem HEAD](http://github.com/pivotal/jasmine-gem)
    * [jasmine-jquery](https://github.com/velesin/jasmine-jquery)
    * [Underscore-MatchersForJasmine](https://github.com/raganwald/Underscore-Matchers-for-Jasmine)
    * [sinon.js](sinonjs.org)

TODO: Example code of jasmine, jasmine fakes, jasmine-jquery, sinon

---
# Interesting JavaScript tests: Timers

TODO: Example timer test

---
# Interesting JavaScript tests: XHR

TODO: Example XHR test with fake server (sinon)

# Presenter Notes

* Alternatively, just mock $.ajax with Jasmine

---
# Interesting JavaScript tests: Async code

---
# Running your tests

* [capybara-webkit](http://github.com/thoughtbot/capybara-webkit)
* [selenium-webdriver](http://rubygems.org/gems/selenium-webdriver)
* `rake jasmine:ci`
* [jasmine-headless-webkit](http://johnbintz.github.com/jasmine-headless-webkit/)

# Presenter Notes

* Selenium vs Capybara-webkit: stopping and debugging

---
# Continuous integration

* [TeamCity](http://www.jetbrains.com/teamcity/)
* [Tddium](https://www.tddium.com/)

TODO: screenshots?
