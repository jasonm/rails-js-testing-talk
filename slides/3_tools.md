# 3/4: Tools and examples

* Writing integration tests
* Writing isolation tests
* Running your tests

# Presenter Notes

---
# Writing integration tests
* `capybara` request specs

# Presenter Notes

* Practices Cucumber encourages:
    * thinking outside-in
    * abstract reusable steps, paths, named interface elements

---
# Writing Rails isolation tests

* `RSpec`
* `factory_girl`
* `mocha`
* `bourne`


# Presenter Notes

* Example code of rspec, factory_girl, mocha
    * RSpec, mocha: copycopter/spec/lib/project_cache_job_spec.rb
    * FG: copycopter/spec/models/project_spec.rb

---
# Choosing your tools

* From [Making JS Unit Testing Work](http://4cupsr.us/blog/2011/9/12/making-javascript-unit-testing-work-part-1-what-matters.html):
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
    * [Underscore-Matchers-For-Jasmine](https://github.com/raganwald/Underscore-Matchers-for-Jasmine)
    * [sinon.js](http://sinonjs.org)
    * [jasmine-sinon](https://github.com/froots/jasmine-sinon)

# Presenter Notes

* Examples of jasmine, jasmine-jquery, and sinon specs
    * jasmine: jasmine_spec.js
    * jasmine-jquery: views/simple_link
    * sinon: http://sinonjs.org/docs/#spies, simple_spy.js, jasmine_spy.js

---
# Interesting JavaScript tests: Timers

* `setTimeout`, `setInterval`
* Animations
* Polling

# Presenter Notes

* examples/jasmine/MockClock
* poller example

---
# Interesting JavaScript tests: XHR

* Isolate your client-side specs from the server

# Presenter Notes

* examples/jasmine/fake_xhr
* Alternatively, just mock $.ajax with Jasmine

---
# Interesting JavaScript tests: Async code

* Callbacks
* Timers

# Presenter Notes

* examples/jasmine/wait_run
* [Jasmine Wiki: Asynchronous specs](https://github.com/pivotal/jasmine/wiki/Asynchronous-specs)

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


# Presenter Notes

* Tddium notes: automatic parallelism, easy setup, and the ability to use parallelism from your local workspace *before* pushing to a shared CI build.  Build artifacts, code coverage, continuous deployment using post-build hooks.  Heroku addon.  Here's a coupon code you can give out for $50 if they sign up after the 2 week trial: rubyjs2012
