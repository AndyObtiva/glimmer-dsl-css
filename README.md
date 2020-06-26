# <img src="https://raw.githubusercontent.com/AndyObtiva/glimmer/master/images/glimmer-logo-hi-res.png" height=85 /> Glimmer DSL for CSS 0.1.0 (Cascading Style Sheets)
[![Gem Version](https://badge.fury.io/rb/glimmer-dsl-css.svg)](http://badge.fury.io/rb/glimmer-dsl-css)
[![Travis CI](https://travis-ci.com/AndyObtiva/glimmer-dsl-css.svg?branch=master)](https://travis-ci.com/github/AndyObtiva/glimmer-dsl-css)
[![Join the chat at https://gitter.im/AndyObtiva/glimmer](https://badges.gitter.im/AndyObtiva/glimmer.svg)](https://gitter.im/AndyObtiva/glimmer?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

[Glimmer](https://github.com/AndyObtiva/glimmer) DSL for CSS provides Ruby syntax for building CSS (Cascading Style Sheets).

Within the context of desktop development, Glimmer DSL for CSS is useful in providing CSS for the [SWT Browser widget](https://github.com/AndyObtiva/glimmer/tree/master#browser-widget).

Other Glimmer DSL gems:
- [glimmer-dsl-swt](https://github.com/AndyObtiva/glimmer-dsl-swt): Glimmer DSL for SWT (Desktop GUI)
- [glimmer-dsl-opal](https://github.com/AndyObtiva/glimmer-dsl-opal): Glimmer DSL for Opal (Web GUI Adapter for Desktop Apps)
- [glimmer-dsl-xml](https://github.com/AndyObtiva/glimmer-dsl-xml): Glimmer DSL for XML (& HTML)

## Setup

Please follow these instructions to make the `glimmer` command available on your system.

### Option 1: Direct Install

Run this command to install directly:
```
jgem install glimmer-dsl-xml -v 0.1.0
```

`jgem` is JRuby's version of `gem` command. 
RVM allows running `gem` as an alias.
Otherwise, you may also run `jruby -S gem install ...`

Add `require 'glimmer-dsl-xml'` to your code after `require glimmer-dsl-swt` or `require glimmer-dsl-opal`

### Option 2: Bundler

Add the following to `Gemfile` after `glimmer-dsl-swt` or `glimmer-dsl-opal`:
```
gem 'glimmer-dsl-xml', '~> 0.1.0'
```

And, then run:
```
jruby -S bundle install
```

That's it! Requiring the gem activates the Glimmer XML DSL automatically.

## CSS DSL

Simply start with `css` keyword and add stylesheet rule sets inside its block using Glimmer DSL syntax.
Once done, you may call `to_s` or `to_css` to get the formatted CSS output.

`css` is the only top-level keyword in the Glimmer CSS DSL

Selectors may be specified by `s` keyword or HTML element keyword directly (e.g. `body`)
Rule property values may be specified by `pv` keyword or underscored property name directly (e.g. `font_size`)

Example (you may copy/paste in [`girb`](#girb-glimmer-irb-command)):

```ruby
@css = css {
  body {
    font_size '1.1em'
    pv 'background', 'white'
  }
  
  s('body > h1') {
    background_color :red
    pv 'font-size', '2em'
  }
}
puts @css
```

## Multi-DSL Support

Learn more about how to use this DSL alongside other Glimmer DSLs:

[Glimmer Multi-DSL Support](https://github.com/AndyObtiva/glimmer/tree/master#multi-dsl-support)

## Help

### Issues

You may submit [issues](https://github.com/AndyObtiva/glimmer/issues) on [GitHub](https://github.com/AndyObtiva/glimmer/issues).

[Click here to submit an issue.](https://github.com/AndyObtiva/glimmer/issues)

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
* [Dennis Theisen](https://github.com/Soleone) (Contributor)

[Click here to view contributor commits.](https://github.com/AndyObtiva/glimmer/graphs/contributors)

## License

Copyright (c) 2007-2020 Andy Maleh.
See LICENSE.txt for further details.
