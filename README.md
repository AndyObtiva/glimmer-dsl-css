# [<img src="https://raw.githubusercontent.com/AndyObtiva/glimmer/master/images/glimmer-logo-hi-res.png" height=85 />](https://github.com/AndyObtiva/glimmer) Glimmer DSL for CSS 1.2.2
[![Gem Version](https://badge.fury.io/rb/glimmer-dsl-css.svg)](http://badge.fury.io/rb/glimmer-dsl-css)
[![Travis CI](https://travis-ci.com/AndyObtiva/glimmer-dsl-css.svg?branch=master)](https://travis-ci.com/github/AndyObtiva/glimmer-dsl-css)
[![Coverage Status](https://coveralls.io/repos/github/AndyObtiva/glimmer-dsl-css/badge.svg?branch=master)](https://coveralls.io/github/AndyObtiva/glimmer-dsl-css?branch=master)
[![Maintainability](https://api.codeclimate.com/v1/badges/c7365cdb8556be433115/maintainability)](https://codeclimate.com/github/AndyObtiva/glimmer-dsl-css/maintainability)
[![Join the chat at https://gitter.im/AndyObtiva/glimmer](https://badges.gitter.im/AndyObtiva/glimmer.svg)](https://gitter.im/AndyObtiva/glimmer?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

[Glimmer](https://github.com/AndyObtiva/glimmer) DSL for CSS provides Ruby syntax for building CSS (Cascading Style Sheets). It used to be part of the [Glimmer](https://github.com/AndyObtiva/glimmer) library (created in 2007), but eventually got extracted into its own project.

Within the context of [Glimmer](https://github.com/AndyObtiva/glimmer) app development, Glimmer DSL for CSS is useful in providing CSS for the [SWT Browser widget](https://github.com/AndyObtiva/glimmer-dsl-swt/tree/master#browser-widget).

Additionally, it is useful with [Glimmer DSL for Opal](https://github.com/AndyObtiva/glimmer-dsl-opal).

Learn more about the differences between various [Glimmer](https://github.com/AndyObtiva/glimmer) DSLs by looking at the **[Glimmer DSL Comparison Table](https://github.com/AndyObtiva/glimmer#glimmer-dsl-comparison-table)**.

## Setup

Please follow these instructions to make the `glimmer` command available on your system.

### Option 1: Direct Install

Run this command to install directly:
```
gem install glimmer-dsl-css -v 1.2.2
```

Note: In case you are using JRuby, `jgem` is JRuby's version of the `gem` command. RVM allows running `gem` as an alias in JRuby. Otherwise, you may also run `jruby -S gem install ...`

Add `require 'glimmer-dsl-css'` to your code.

When using with [Glimmer DSL for SWT](https://github.com/AndyObtiva/glimmer-dsl-swt) or [Glimmer DSL for Opal](https://github.com/AndyObtiva/glimmer-dsl-opal), make sure it is added after `require glimmer-dsl-swt` and `require glimmer-dsl-opal` to give it a lower precedence than them when processed by the Glimmer DSL engine.

That's it! Requiring the gem activates the Glimmer CSS DSL automatically.

### Option 2: Bundler

Add the following to `Gemfile` (after `glimmer-dsl-swt` and/or `glimmer-dsl-opal` if included too):
```
gem 'glimmer-dsl-css', '~> 1.2.2'
```

And, then run:
```
bundle install
```

Note: When using JRuby, prefix with `jruby -S`

Require in your code via Bundler (e.g. `require 'bundler'; Bundler.require`) or add `require 'glimmer-dsl-css'` to your code.

When using with Glimmer DSL for SWT or Glimmer DSL for Opal, make sure it is loaded after `glimmer-dsl-swt` and `glimmer-dsl-opal` to give it a lower precedence than them when processed by the Glimmer DSL engine.

That's it! Requiring the gem activates the Glimmer CSS DSL automatically.

## CSS DSL

The key reason for using the CSS DSL instead of actual CSS is Ruby programmability without getting lost in string concatenations. The CSS DSL helps in including conditional CSS as well as looping from lists while building CSS.

Simply start with `css` keyword and add stylesheet rule sets inside its block using Glimmer DSL syntax.
Once done, you may call `to_s` or `to_css` to get the formatted CSS output.

`css` is the only top-level keyword in the Glimmer CSS DSL

Selectors may be specified by `s` keyword or HTML element keyword directly (e.g. `body`)
Rule property values may be specified by `pv` keyword or underscored property name directly (e.g. `font_size`)

Example (you can try in IRB):

```ruby
require 'glimmer-dsl-css'
include Glimmer
@css = css {
  body {
    font_size '1.1em'
    background 'white'
  }
  s('body > h1') {
    background_color :red
    font_size 24
  }
}
puts @css
```

Output (minified CSS):

```css
body{font-size:1.1em;background:white}body > h1{background-color:red;font-size:24px}
```

### Numeric Values

As you saw above, numeric values (e.g. `24` in `font_size 24`) automatically get suffixed with `px` by convention (e.g. `24px`).

## Multi-DSL Support

Learn more about how to use this DSL alongside other Glimmer DSLs:

[Glimmer Multi-DSL Support](https://github.com/AndyObtiva/glimmer/tree/master#multi-dsl-support)

## Help

### Issues

You may submit [issues](https://github.com/AndyObtiva/glimmer-dsl-css/issues) on [GitHub](https://github.com/AndyObtiva/glimmer-dsl-css/issues).

[Click here to submit an issue.](https://github.com/AndyObtiva/glimmer-dsl-css/issues)

### Chat

If you need live help, try to [![Join the chat at https://gitter.im/AndyObtiva/glimmer](https://badges.gitter.im/AndyObtiva/glimmer.svg)](https://gitter.im/AndyObtiva/glimmer?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

## Feature Suggestions

These features have been suggested. You might see them in a future version of Glimmer. You are welcome to contribute more feature suggestions.

[TODO.md](TODO.md)

## Change Log

[CHANGELOG.md](CHANGELOG.md)

## Contributing

[CONTRIBUTING.md](CONTRIBUTING.md)

## Contributors

* [Andy Maleh](https://github.com/AndyObtiva) (Founder)

[Click here to view contributor commits.](https://github.com/AndyObtiva/glimmer-dsl-css/graphs/contributors)

## License

[MIT](LICENSE.txt)

Copyright (c) 2020-2023 - Andy Maleh.

--

[<img src="https://raw.githubusercontent.com/AndyObtiva/glimmer/master/images/glimmer-logo-hi-res.png" height=40 />](https://github.com/AndyObtiva/glimmer) Built for [Glimmer](https://github.com/AndyObtiva/glimmer) (Ruby Desktop Development GUI Library).
