# Copyright (c) 2020-2022 - Andy Maleh
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

module Glimmer
  module CSS
    class Rule
      attr_reader :selector, :properties

      def initialize(selector)
        @selector = selector
        @properties = {}
      end

      def add_property(keyword, *args)
        keyword = keyword.to_s.downcase.gsub('_', '-')
        @properties[keyword] = args.first
      end

      def to_css
        css = "#{@selector}{"
        css += @properties.map do |name, value|
          value = "#{value}px" if value.is_a?(Numeric)
          "#{name}:#{value}"
        end.join(';')
        css += "}"
      end

      alias to_s to_css
    end
  end
end
