# 2/4: Methods

---

# How to test

* Write test first.
* Red-Green-Refactor cycle.
* Feedback during development.
* Catch regressions later.

---

# Outside-in Development

* Focus on satisfying user's needs

# Presenter Notes

* Start with integration / acceptance tests, drill in
* Process of "driving out" or "motivating"
* Gives us clear understanding of goals and motivation of features
* Explicitly requires stakeholders to define who, what and *why*.

---

# Integration testing

* Full stack
* How things fit together

# Presenter Notes

* Exercises entire stack and how different units interact with each other.
* High level, slower
* Can expose defects not found in unit tests.

---

# Isolation testing

* Smaller pieces
* Code design tool

# Presenter Notes

* Specify behavior of smaller units of software.
* Tight feedback &ndash; loop
* Low level, fast
* Useful design tool, bad code is hard to test.

---

# What to test

TODO

integration: coarsely-grained user stories, "tracer bullet" / happy cases

public APIs of your modules (sanity checks, correctness checks, regression test cases, test-driving to build good interfaces)

especially: complex logic (model computations, view/presentation helpers with date/time computation, comparisons, edge cases)

brittle integration points (event bindings)

dont test: framework, low-cost failures

dont neglect to test: things that are hard to test

http://37signals.com/svn/posts/3159-testing-like-the-tsa
