require "spec_helper"

require 'glimmer/css/css_to_glimmer_converter'
  
describe Glimmer::CSS::CSSToGlimmerConverter do
  let(:prefix) do
    string = <<~MULTI
      require 'glimmer-dsl-css'
      
      include Glimmer
      
      style_sheet = css {
    MULTI
    string.chomp
  end
  
  let(:suffix) do
    string = <<~MULTI
      }
      
      puts style_sheet.to_s
    MULTI
    string.chomp
  end
  
  it 'converts 1 simple rule and 1 property' do
    css = <<~CSS
      body h1.header {
        font-weight: bold;
      }
    CSS
    
    glimmer = subject.convert(css)
    
    expected_glimmer = <<~GLIMMER
      #{prefix}
        rule('body h1.header') {
          font_weight 'bold'
        }
      #{suffix}
    GLIMMER
    
    expect(glimmer).to eq(expected_glimmer)
  end
  
  it 'converts 1 simple rule and 2 properties' do
    css = <<~CSS
      body h1.header {
        font-weight: bold;
        font-family: "'Times New Roman', Arial";
      }
    CSS
    
    glimmer = subject.convert(css)
    
    expected_glimmer = <<~GLIMMER
      #{prefix}
        rule('body h1.header') {
          font_weight 'bold'
          font_family '"Times New Roman", Arial'
        }
      #{suffix}
    GLIMMER
    
    expect(glimmer).to eq(expected_glimmer)
  end
  
  it 'converts 1 complex rule and 3 properties' do
    css = <<~CSS
      :focus,
      .toggle:focus + label,
      .toggle-all:focus + label {
        margin: 15px;
        box-shadow: 0 0 2px 2px #CF7D7D;
      }
    CSS
    
    glimmer = subject.convert(css)
    
    expected_glimmer = <<~GLIMMER
      #{prefix}
        rule(':focus, .toggle:focus + label, .toggle-all:focus + label') {
          margin '15px'
          box_shadow '0 0 2px 2px #CF7D7D'
        }
      #{suffix}
    GLIMMER
    
    expect(glimmer).to eq(expected_glimmer)
  end
  
  it 'converts 1 media query, 2 rules, and 2 properties' do
    css = <<~CSS
      @media (max-width: 430px) {
        .footer {
          max_height: 50px;
        }
      
        .filters {
          min_height: 10px;
        }
      }
    CSS
    
    glimmer = subject.convert(css)
    
    expected_glimmer = <<~GLIMMER
      #{prefix}
        media('(max-width: 430px)') {
          rule('.footer') {
            max_height '50px'
          }
          
          rule('.filters') {
            min_height '10px'
          }
        }
      #{suffix}
    GLIMMER
    
    expect(glimmer).to eq(expected_glimmer)
  end
  
  it 'converts 2 media queries, 4 rules, and 5 properties' do
    css = <<~CSS
      @media (max-width: 430px) {
        .footer {
          height: 40px;
          max_height: 50px;
        }
      
        .filters {
          min_height: 10px;
        }
      }
      
      @media screen and (-webkit-min-device-pixel-ratio:0) {
        .toggle-all,
        .todo-list li .toggle {
          background: none;
        }
      
        .todo-list li .toggle {
          height: 40px;
        }
      }
    CSS
    
    glimmer = subject.convert(css)
    
    expected_glimmer = <<~GLIMMER
      #{prefix}
        media('(max-width: 430px)') {
          rule('.footer') {
            height '40px'
            max_height '50px'
          }
          
          rule('.filters') {
            min_height '10px'
          }
        }
        
        media('screen and (-webkit-min-device-pixel-ratio:0)') {
          rule('.toggle-all, .todo-list li .toggle') {
            background 'none'
          }
          
          rule('.todo-list li .toggle') {
            height '40px'
          }
        }
      #{suffix}
    GLIMMER
    
    expect(glimmer).to eq(expected_glimmer)
  end
  
  it 'converts rules outside of a media query + 2 media queries' do
    css = <<~CSS
      .header {
        height: 80px;
        max_height: 100px;
      }
      
      .footer {
        height: 40px;
        max_height: 50px;
      }
      
      @media (max-width: 430px) {
        .filters {
          min_height: 10px;
        }
      }
      
      @media screen and (-webkit-min-device-pixel-ratio:0) {
        .toggle-all,
        .todo-list li .toggle {
          background: none;
        }
      
        .todo-list li .toggle {
          height: 40px;
        }
      }
    CSS
    
    glimmer = subject.convert(css)
    
    expected_glimmer = <<~GLIMMER
      #{prefix}
        rule('.header') {
          height '80px'
          max_height '100px'
        }
        
        rule('.footer') {
          height '40px'
          max_height '50px'
        }
        
        media('(max-width: 430px)') {
          rule('.filters') {
            min_height '10px'
          }
        }
        
        media('screen and (-webkit-min-device-pixel-ratio:0)') {
          rule('.toggle-all, .todo-list li .toggle') {
            background 'none'
          }
          
          rule('.todo-list li .toggle') {
            height '40px'
          }
        }
      #{suffix}
    GLIMMER
    
    expect(glimmer).to eq(expected_glimmer)
  end
  
  described_class::RULE_KEYWORDS.each do |rule_keyword|
    it "converts 1 simple rule and 1 property with #{rule_keyword} variation" do
      subject = described_class.new(rule_keyword: 'rul')
      
      css = <<~CSS
        body h1.header {
          font-weight: bold;
        }
      CSS
      
      glimmer = subject.convert(css)
      
      expected_glimmer = <<~GLIMMER
        #{prefix}
          rul('body h1.header') {
            font_weight 'bold'
          }
        #{suffix}
      GLIMMER
      
      expect(glimmer).to eq(expected_glimmer)
    end
  end
  
  it 'fails to convert css with invalid abc rule variation' do
    expect { described_class.new(rule_keyword: 'abc') }.to raise_error
  end
  
  
  xit 'converts rules with CSS nesting' do
    css = <<~CSS
      body {
        & .h1.header {
          font-weight: bold;
          font-family: "'Times New Roman', Arial";
        }
      }
    CSS
    
    glimmer = subject.convert(css)
    
    expected_glimmer = <<~GLIMMER
      #{prefix}
        rule('body h1.header') {
          font_weight 'bold'
          font_family '"Times New Roman", Arial'
        }
      #{suffix}
    GLIMMER
    
    expect(glimmer).to eq(expected_glimmer)
  end
end
