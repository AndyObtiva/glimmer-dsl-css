require "spec_helper"
  
describe "Glimmer CSS DSL" do
  include Glimmer

  it 'renders empty element selector' do
    @target = css {
      a {
      }
    }
   
    expect(@target).to be_a(Glimmer::CSS::StyleSheet)
    expect(@target.to_css).to eq('a{}')
    expect(@target.to_s).to eq(@target.to_css)
  end
   
  it 'renders element selector with one property' do
    @target = css {
      a {
        background :red
      }
    }
   
    expect(@target.to_css).to eq('a{background:red}')
  end
   
  it 'renders element selector with two properties' do
    @target = css {
      a {
        background :red
        text_align :center
      }
    }
   
    expect(@target.to_css).to eq('a{background:red;text-align:center}')
  end
   
  it 'renders two element selectors with two properties each' do
    @target = css {
      h1 {
        font_size '2em'
        font_family '"Times New Roman", Times, serif'
      }
      a {
        background :red
        text_align :center
      }
    }
   
    expect(@target.to_css).to eq('h1{font-size:2em;font-family:"Times New Roman", Times, serif}a{background:red;text-align:center}')
  end
   
  it 'renders two custom selectors with two properties each (one is numeric representing pixels)' do
    @target = css {
      s('body#app h1#title') {
        font_size 16
        font_family '"Times New Roman", Times, serif'
      }
      s('section#menu > a#home') {
        background :red
        text_align :center
      }
    }
   
    expect(@target.to_css).to eq('body#app h1#title{font-size:16px;font-family:"Times New Roman", Times, serif}section#menu > a#home{background:red;text-align:center}')
  end
   
  it 'renders two custom selectors with two properties each (one is numeric representing pixels) using rule' do
    @target = css {
      rule('body#app h1#title') {
        font_size 16
        font_family '"Times New Roman", Times, serif'
      }
      rule('section#menu > a#home') {
        background :red
        text_align :center
      }
    }
   
    expect(@target.to_css).to eq('body#app h1#title{font-size:16px;font-family:"Times New Roman", Times, serif}section#menu > a#home{background:red;text-align:center}')
  end
   
  it 'renders two custom selectors with two properties each (one is numeric representing pixels) using rul' do
    @target = css {
      rul('body#app h1#title') {
        font_size 16
        font_family '"Times New Roman", Times, serif'
      }
      rul('section#menu > a#home') {
        background :red
        text_align :center
      }
    }
   
    expect(@target.to_css).to eq('body#app h1#title{font-size:16px;font-family:"Times New Roman", Times, serif}section#menu > a#home{background:red;text-align:center}')
  end
   
  it 'renders two custom selectors with two properties each (one is numeric representing pixels) using ru' do
    @target = css {
      ru('body#app h1#title') {
        font_size 16
        font_family '"Times New Roman", Times, serif'
      }
      ru('section#menu > a#home') {
        background :red
        text_align :center
      }
    }
   
    expect(@target.to_css).to eq('body#app h1#title{font-size:16px;font-family:"Times New Roman", Times, serif}section#menu > a#home{background:red;text-align:center}')
  end
   
  it 'renders two custom selectors with two properties each (one is numeric representing pixels) using r' do
    @target = css {
      r('body#app h1#title') {
        font_size 16
        font_family '"Times New Roman", Times, serif'
      }
      r('section#menu > a#home') {
        background :red
        text_align :center
      }
    }
   
    expect(@target.to_css).to eq('body#app h1#title{font-size:16px;font-family:"Times New Roman", Times, serif}section#menu > a#home{background:red;text-align:center}')
  end
   
  it 'renders two custom selectors with two properties each (one is numeric representing pixels) using _' do
    @target = css {
      _('body#app h1#title') {
        font_size 16
        font_family '"Times New Roman", Times, serif'
      }
      _ 'section#menu > a#home' do
        background :red
        text_align :center
      end
    }
   
    expect(@target.to_css).to eq('body#app h1#title{font-size:16px;font-family:"Times New Roman", Times, serif}section#menu > a#home{background:red;text-align:center}')
  end
   
  it 'renders two custom selectors with two custom properties each' do
    @target = css {
      s('body#app h1#title') {
        pv 'font-size', '2em'
        pv 'font-family', '"Times New Roman", Times, serif'
      }
      s('section#menu > a#home') {
        pv 'background', 'red'
        pv 'text_align', 'center'
      }
    }
   
    expect(@target.to_css).to eq('body#app h1#title{font-size:2em;font-family:"Times New Roman", Times, serif}section#menu > a#home{background:red;text-align:center}')
  end
  
  context 'Media Queries' do
    it 'renders two custom selectors in a media query' do
      @target = css {
        media('screen and (min-width: 30em) and (orientation: landscape)') {
          rule('body#app h1#title') {
            font_size 16
            font_family '"Times New Roman", Times, serif'
          }
          rule('section#menu > a#home') {
            background :red
            text_align :center
          }
        }
      }
     
      expect(@target.to_css).to eq('@media screen and (min-width: 30em) and (orientation: landscape){body#app h1#title{font-size:16px;font-family:"Times New Roman", Times, serif}section#menu > a#home{background:red;text-align:center}}')
    end
    
    it 'renders two custom selectors each in a separate media query' do
      @target = css {
        media('screen and (min-width: 30em) and (orientation: landscape)') {
          rule('body#app h1#title') {
            font_size 16
            font_family '"Times New Roman", Times, serif'
          }
        }
        
        media('screen and (min-width: 60em) and (orientation: portrait)') {
          rule('section#menu > a#home') {
            background :red
            text_align :center
          }
        }
      }
     
      expect(@target.to_css).to eq('@media screen and (min-width: 30em) and (orientation: landscape){body#app h1#title{font-size:16px;font-family:"Times New Roman", Times, serif}}@media screen and (min-width: 60em) and (orientation: portrait){section#menu > a#home{background:red;text-align:center}}')
    end
  end
   
end
