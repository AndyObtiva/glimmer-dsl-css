# Copyright (c) 2020-2024 - Andy Maleh
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

require 'glimmer/dsl/engine'
# Dir[File.expand_path('../*_expression.rb', __FILE__)].each {|f| require f} # cannot in Opal
require 'glimmer/dsl/css/element_rule_expression'
require 'glimmer/dsl/css/dynamic_property_expression'
require 'glimmer/dsl/css/css_expression'
require 'glimmer/dsl/css/raw_expression'
require 'glimmer/dsl/css/rule_expression'
require 'glimmer/dsl/css/rul_expression'
require 'glimmer/dsl/css/ru_expression'
require 'glimmer/dsl/css/s_expression'
require 'glimmer/dsl/css/pv_expression'
require 'glimmer/dsl/css/display_expression'
require 'glimmer/dsl/css/media_expression'

module Glimmer
  module DSL
    module CSS
      Engine.add_dynamic_expressions(
        CSS,
        %w[
          dynamic_property
          element_rule
        ]
      )
    end
  end
end
