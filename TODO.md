# TODO

Here is a list of tasks to do (moved to CHANGELOG.md once done).

## Next

- Document how to include method-based CSS mixins in Glimmer DSL for CSS
- Document an example with an `if` statement and with looping (e.g. `times` or `each`)
- Support nesting rules within each other (e.g. `r('table') { r('tr') { background :blue } }` is equivalent to `r('table tr') { background :blue }`)
- Support mixins via classes (class-based CSS mixins)
- Optimize performance by removing unnecessary DSL expressions like element_rule_expression.rb and pv_expression.rb
- Removed unnecessary files that are remnant of original glimmer before extraction

## Tasks

- Support [all CSS functions](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Functions) like `rgb(r, g, b)` and `rgba(r, g, b, a)` and dashes become underscore like `linear-gradient()` becoming `linear_gradient()`. This probably has to be done in a dynamic way to generate any function.
- Support colors as Hex Ruby values (e.g. `0x1f3b5d`)

## Maybe

- Consider implementing `Numeric` unit methods like `px` and `pt` to be able to write values not as Strings like `39.px`. This idea might not be worth the cost if using Strings is good enough.
