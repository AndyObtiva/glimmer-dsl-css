# [<img src="https://raw.githubusercontent.com/AndyObtiva/glimmer/master/images/glimmer-logo-hi-res.png" height=85 />](https://github.com/AndyObtiva/glimmer) Glimmer DSL for CSS 1.5.2
## Ruby Programmable Cascading Style Sheets
[![Gem Version](https://badge.fury.io/rb/glimmer-dsl-css.svg)](http://badge.fury.io/rb/glimmer-dsl-css)
[![Travis CI](https://travis-ci.com/AndyObtiva/glimmer-dsl-css.svg?branch=master)](https://travis-ci.com/github/AndyObtiva/glimmer-dsl-css)
[![Coverage Status](https://coveralls.io/repos/github/AndyObtiva/glimmer-dsl-css/badge.svg?branch=master)](https://coveralls.io/github/AndyObtiva/glimmer-dsl-css?branch=master)
[![Maintainability](https://api.codeclimate.com/v1/badges/c7365cdb8556be433115/maintainability)](https://codeclimate.com/github/AndyObtiva/glimmer-dsl-css/maintainability)
[![Join the chat at https://gitter.im/AndyObtiva/glimmer](https://badges.gitter.im/AndyObtiva/glimmer.svg)](https://gitter.im/AndyObtiva/glimmer?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

[Glimmer](https://github.com/AndyObtiva/glimmer) DSL for CSS provides Ruby syntax for building CSS (Cascading Style Sheets), included in [Glimmer DSL for Web](https://github.com/AndyObtiva/glimmer-dsl-web) (Ruby in the Browser Web Frontend Framework) to use in Rails Frontend Development. It used to be part of the [Glimmer](https://github.com/AndyObtiva/glimmer) library (created in 2007), but eventually got extracted into its own project. The Ruby gem also includes a [CSS to Glimmer converter](#css-to-glimmer-converter) (`css_to_glimmer`) to automatically convert legacy CSS code into Glimmer DSL syntax.

Example (you can try in IRB):

```ruby
require 'glimmer-dsl-css'

include Glimmer

@css = css {
  body {
    font_size 1.1.em
    background 'white'
    width 90.%
    height 100.%
  }
  
  rule('body > h1') {
    background_color :red
    font_size 24
  }
  
  media('screen and (min-width: 30em) and (orientation: landscape)') {
    rule('body#app h1#title') {
      font_size 16
      font_family '"Times New Roman", Times, serif'
    }
  }
}

puts @css
```

Output (minified CSS):

```css
body{font-size:1.1em;background:white;width:90%;height:100%}body > h1{background-color:red;font-size:24px}@media screen and (min-width: 30em) and (orientation: landscape){body#app h1#title{font-size:16px;font-family:"Times New Roman", Times, serif}}
```

The key reason for using the CSS DSL instead of actual CSS is Ruby programmability without getting lost in string concatenations. The CSS DSL helps in including conditional CSS with `if` or ternery expressions as well as looping from lists while building CSS.

```
  rule('body > h1') {
    background_color is_error ? :red : :green
    font_size new_user ? 24 : 20
  }
```

Within the context of [Glimmer](https://github.com/AndyObtiva/glimmer) app development, Glimmer DSL for CSS is useful in providing CSS for [Glimmer DSL for Web](https://github.com/AndyObtiva/glimmer-dsl-web), [Glimmer DSL for Opal](https://github.com/AndyObtiva/glimmer-dsl-opal), and the [SWT Browser widget](https://github.com/AndyObtiva/glimmer-dsl-swt/tree/master#browser-widget).

Learn more about the differences between various [Glimmer](https://github.com/AndyObtiva/glimmer) DSLs by looking at the **[Glimmer DSL Comparison Table](https://github.com/AndyObtiva/glimmer#glimmer-dsl-comparison-table)**.

## Setup

Please follow these instructions to make the `glimmer` command available on your system.

### Option 1: Direct Install

Run this command to install directly:
```
gem install glimmer-dsl-css -v 1.5.2
```

Note: In case you are using JRuby, `jgem` is JRuby's version of the `gem` command. RVM allows running `gem` as an alias in JRuby. Otherwise, you may also run `jruby -S gem install ...`

Add `require 'glimmer-dsl-css'` to your code.

When using with [Glimmer DSL for SWT](https://github.com/AndyObtiva/glimmer-dsl-swt) or [Glimmer DSL for Opal](https://github.com/AndyObtiva/glimmer-dsl-opal), make sure it is added after `require glimmer-dsl-swt` and `require glimmer-dsl-opal` to give it a lower precedence than them when processed by the Glimmer DSL engine.

That's it! Requiring the gem activates the Glimmer CSS DSL automatically.

### Option 2: Bundler

Add the following to `Gemfile` (after `glimmer-dsl-swt` and/or `glimmer-dsl-opal` if included too):
```
gem 'glimmer-dsl-css', '~> 1.5.2'
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

The key reason for using the CSS DSL instead of actual CSS is Ruby programmability without getting lost in string concatenations. The CSS DSL helps in including conditional CSS with `if` or ternery expressions as well as looping from lists while building CSS.

```
  _('body > h1') {
    background_color is_error ? :red : :green
    font_size new_user ? 24 : 20
  }
```

Simply start with `css` keyword and add stylesheet rule sets inside its block using Glimmer DSL syntax.
Once done, you may call `to_s` or `to_css` to get the formatted CSS output.

`css` is the only top-level keyword in the Glimmer CSS DSL

Selectors may be specified by any of `_`, `s`, `r`, `ru`, `rul`, `rule` keywords or HTML element keyword directly (e.g. `body`)
Rule property values may be specified by underscored property name directly (e.g. `font_size`), which is auto-translated to CSS property name by replacing underscores with dashes (e.g. `font-size`)

Example (you can try in IRB):

```ruby
require 'glimmer-dsl-css'

include Glimmer

@css = css {
  body {
    font_size '1.1em'
    background 'white'
  }
  
  r('body > h1') {
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

The `body > h1` rule could have been written in any other alternative way:

```ruby
  rule('body > h1') {
    background_color :red
    font_size 24
  }
```

```ruby
  rul('body > h1') {
    background_color :red
    font_size 24
  }
```

```ruby
  _('body > h1') {
    background_color :red
    font_size 24
  }
```

```ruby
  _ 'body > h1' do
    background_color :red
    font_size 24
  end
```

### Numeric Values and Unit Types

All CSS unit types are supported by invoking methods matching them on Numeric objects (e.g. `3.em` produces `'3em'`):
- `px` (default if not specified)
- `pt`
- `pc`
- `Q`
- `in`
- `cm`
- `mm`
- `em`
- `rem`
- `vh`
- `vw`
- `vmin`
- `vmax`
- `%`

For example:

```ruby
require 'glimmer-dsl-css'

include Glimmer

@css = css {
  body {
    font_size 1.1.em
    width 80.%
    height 100.%
    background 'white'
  }
  
  r('body > h1') {
    font_size 24.px
    background_color :red
  }
}

puts @css
```

Output (minified CSS):

```css
body{font-size:1.1em;width:80%;height:100%;background:white}body > h1{font-size:24px;background-color:red}
```

Also, as you saw above, numeric values (e.g. `24` in `font_size 24`) automatically get suffixed with `px` by convention (e.g. `24px`).

```ruby
require 'glimmer-dsl-css'

include Glimmer

@css = css {
  body {
    font_size 14
    background 'white'
  }
  _ 'body > h1' do
    background_color :red
    font_size 24
  end
}

puts @css
```

Output (minified CSS):

```css
body{font-size:14px;background:white}body > h1{background-color:red;font-size:24px}
```

### Raw CSS

You can mix in raw CSS with Glimmer CSS DSL syntax by using the `raw` keyword and passing it an argument that is the raw CSS `String`. That enables adding programmability (e.g. `if/else` statements) to some parts of a CSS document while leaving the others as raw CSS.

Example (you can try in IRB):

```ruby
require 'glimmer-dsl-css'

include Glimmer

color = 'black'
size = 8

@css = css {
  # Programmable CSS
  body {
    font_size size < 10 ? "0.#{size}em" : '1.1em'
    background color.nil? ? 'white' : color
  }
  
  # Non-Programmable CSS
  raw '
  body > h1 {
    background-color: red;
    font-size: 24px;
  }
  
  body > section {
    font-size: 16px;
  }
  '
}

puts @css
```

Output (minified CSS):

```css
body{font-size:0.8em;background:black}body > h1 {background-color: red;font-size: 24px;}body > section {font-size: 16px;}
```

### CSS to Glimmer Converter

The Ruby gem includes a CSS to Glimmer converter (`css_to_glimmer`) to automatically convert legacy CSS code into Glimmer DSL syntax.

Script:

[bin/css_to_glimmer](/bin/css_to_glimmer)

Usage:

```
css_to_glimmer [-r=rule_keyword] path_to_css_file
```

Example:

Suppose we have a CSS file called `input.css`:

```css
html, body {
  margin:0;
  padding:0;
}

@media (max-width: 430px) {
  .footer {
    height:50px;
  }

  .filters {
    bottom:10px;
  }
}
```

We can run this command:

```
css_to_glimmer input.css
```

Printout:

```
Converting from CSS syntax to Glimmer DSL Ruby syntax for input file: input.css
Converted output file: input.css.glimmer.rb
```

Output file (`input.css.glimmer.rb`) is a runnable Ruby file containing Glimmer DSL for CSS syntax:

```ruby
require 'glimmer-dsl-css'

include Glimmer

style_sheet = css {
  rule('html,body') {
    margin '0'
    padding '0'
  }
  
  media('(max-width: 430px)') {
    rule('.footer') {
      height '50px'
    }
    
    rule('.filters') {
      bottom '10px'
    }
  }
}

puts style_sheet.to_s
```

If you would rather customize the `rule` keyword with a shorter alias like `rul`, `ru`, `r`, `s` (for selector), or `_`, you can run the following command:

```
css_to_glimmer -r=ru input.css
```

Output file (`input.css.glimmer.rb`) is a runnable Ruby file containing Glimmer DSL for CSS syntax:

```ruby
require 'glimmer-dsl-css'

include Glimmer

style_sheet = css {
  ru('html,body') {
    margin '0'
    padding '0'
  }
  
  media('(max-width: 430px)') {
    ru('.footer') {
      height '50px'
    }
    
    ru('.filters') {
      bottom '10px'
    }
  }
}

puts style_sheet.to_s
```

## Multi-DSL Support

Learn more about how to use this DSL alongside other Glimmer DSLs:

[Glimmer Multi-DSL Support](https://github.com/AndyObtiva/glimmer/tree/master#multi-dsl-support)

## Influences

- https://github.com/opal/paggio

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

Copyright (c) 2020-2024 - Andy Maleh.

--

[<img src="https://raw.githubusercontent.com/AndyObtiva/glimmer/master/images/glimmer-logo-hi-res.png" height=40 />](https://github.com/AndyObtiva/glimmer) Built for [Glimmer](https://github.com/AndyObtiva/glimmer) (Ruby Desktop Development GUI Library).
