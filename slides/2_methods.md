# 2/4: Methods

# Presenter Notes

* How we approach testing.

---

# How to test

* Write test first.
* Red-Green-Refactor cycle.
* Feedback during development.
* Catch regressions later.


---

# A little terminology

* *Integration test*
* *Component test*
* *Isolation test*
* Acceptance test
* End-to-end test
* Unit test
* Functional test

# Presenter Notes

* Rails confusions: functional (controller + view), unit (model + db)

---

# Outside-in Development

* Focus on satisfying user's needs

# Presenter Notes

* Example
* Two levels
* Start with integration / acceptance tests, drill in
* Process of "driving out" or "motivating"
* Gives us clear understanding of goals and motivation of features
    * Good opportunity to require stakeholders to define who, what and *why*.

---

# Integration testing

* Full stack
* How things fit together

# Presenter Notes

* Exercises entire stack and how different units interact with each other.
* High level, slower
* Can expose defects not found in unit tests.
* 2 concerns: testing from user perspective, testing components integrate correctly

---

# Isolation and component testing

* Smaller pieces
* Code design tool

# Presenter Notes

* Specify behavior of smaller units of software.
* Tight feedback &ndash; loop
* Low level, fast
* Useful design tool, bad code is hard to test.
* First client, set up in a clean context. Guides you: coupling, knowledge of other modules, #/collaborators

---
# What to test

* Things with a high cost or likelihood of failure
    * User stories, main paths
    * Public APIs of your components
    * Complex logic
    * Brittle integration points

# Presenter Notes
* Integration: coarsely-grained user stories, "tracer bullet" / happy cases
* Public APIs: sanity checks, correctness checks, regression test cases, test-driving to build good interfaces
* Complex logic: model computations, view/presentation helpers with date/time computation, comparisons, edge cases
* Brittle integration points (presenters, event bindings)

---
# What not to test

* Things with a low cost or likelihood of failure
* [Testing like the TSA](http://37signals.com/svn/posts/3159-testing-like-the-tsa)

---
# What not to test
* *Kent Beck*: "I get paid for code that works, not for tests, so my philosophy is to test as little as possible to reach a given level of confidence. If I don’t typically make a kind of mistake, I don’t test for it."

# Presenter Notes

---
# What not to avoid testing

* Things that are hard to test

# Presenter Notes

* Note: that's different from "time-consuming"

---
# Your optimal approach

# Presenter Notes
* Judgement, intuition of code/benefit
    * Comfort and ability with tools
    * Past experience with the usefulness of an existing suite
* There are diminishing returns, but the good news with that is: your first efforts should be highly valuable.
