# Change Log

## 1.4.1

- Optimize performance (mostly in Opal) by re-ordering dsl.rb to give preference to dynamic property expressions, removing media from its chain of responsibility (it does not need to be there because it is a static expression), and re-ordering conditional checks in dynamic property expression and element rule expression.

## 1.4.0

- `css_to_glimmer` converter command for automatically converting CSS to Glimmer DSL Ruby code
- `css_to_glimmer` -r=rule_keyword option to customize rule keyword (rule has aliases: rul, ru, r, s, _)
- `minifier` converter command for automatically minifying CSS
- Fix issue with `display` CSS property not getting interpreted successfully in Glimmer DSL Ruby code

## 1.3.0

- Support media queries

## 1.2.3

- Add `r`, `ru`, `rul`, `rule`, `_` alternatives to `s` for specifying a CSS rule selector with a block of expressions (e.g. `r('body > h1') { color: red; }`)

## 1.2.2

- Relax glimmer dependency to between 2.0.0 and 3.0.0

## 1.2.1

- Relax glimmer dependency to between 2.0.0 and 2.4.x

## 1.2.0

- Upgrade to glimmer 2.0.0

## 1.1.0

- Opal Ruby Compatibility by removing `String` mutations via `<<` method
- Make `pv` always interpret numeric values as pixels by convention.

## 1.0.0

- Upgraded to Glimmer 1.0.0

## 0.2.0

- Relaxed dependency on glimmer

## 0.1.0

- Extracted Glimmer DSL for CSS (glimmer-dsl-css gem) from Glimmer
