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

require 'css_parser'
require_relative 'css_minifier'

module Glimmer
  module CSS
    class CSSToGlimmerConverter
      include CssParser
      
      RULE_KEYWORDS = %w[rule rul ru r s _]
      
      # This option specifies if we want to use the default rule keyword or an alias like rul or r
      attr_reader :rule_keyword
      
      def initialize(rule_keyword: 'rule')
        @rule_keyword = rule_keyword.to_s
        validate_rule_keyword
      end
      
      def convert(css)
        glimmer = ''
        glimmer += "require 'glimmer-dsl-css'\n\n"
        glimmer += "include Glimmer\n\n"
        glimmer += "style_sheet = css {\n"
        glimmer += convert_css(css).lines.map { |line| "  #{line}" }.join
        glimmer += "}\n\n"
        glimmer += "puts style_sheet.to_s\n"
      end
      
      def minify(css)
        CSSMinifier.new.convert(css)
      end
      
      def remove_charset(css)
        css.sub(/@charset[^;]*;/, '')
      end
      
      def remove_comments(css)
        output = ''
        comment = false
        current_two_characters = [];
        css.chars.each do |character|
          output << character if !comment
          current_two_characters.shift if current_two_characters.size == 2
          current_two_characters << character
          if !comment && current_two_characters.join == '/*'
            comment = true
            output = output[0...-2]
          elsif comment && current_two_characters.join == '*/'
            comment = false
          end
        end
        output
      end
      
      private
      
      def convert_css(css)
        parser = CssParser::Parser.new
        parser.load_string!(css)
        parser.rules_by_media_query.map do |media_query, rule_set|
          if media_query == :all
            convert_rule_set_to_glimmer(rule_set)
          else
            convert_media_query_rule_set_to_glimmer(rule_set, media_query)
          end
        end.join("\n")
      end
      
      def convert_rule_set_to_glimmer(rule_set)
        glimmer = ''
        rule_set.each_with_index do |rule, index|
          glimmer += "\n" if index > 0
          rule_selector = rule.selectors.join(', ').gsub("'", '"')
          glimmer += "#{rule_keyword}('#{rule_selector}') {\n"
          rule.each_declaration do |declaration, value|
            property_name = declaration.gsub('-', '_')
            property_value = value.sub(/^("|')/, '').sub(/("|')$/, '').gsub("'", '"')
            glimmer += "  #{property_name} '#{property_value}'\n"
          end
          glimmer += "}\n"
        end
        glimmer
      end
      
      def convert_media_query_rule_set_to_glimmer(rule_set, media_query)
        glimmer = ''
        glimmer += "media('#{media_query.to_s.gsub("'", '"')}') {\n"
        glimmer += convert_rule_set_to_glimmer(rule_set).lines.map { |line| "  #{line}" }.join
        glimmer += "}\n"
        glimmer
      end
      
      private
      
      def validate_rule_keyword
        raise "rule_keyword '#{rule_keyword}' is invalid! It must be 'rule', 'rul', 'ru', 'r', 's', or '_'" if !RULE_KEYWORDS.include?(rule_keyword)
      end
    end
  end
end
