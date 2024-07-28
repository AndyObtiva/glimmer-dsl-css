require "spec_helper"
  
describe Numeric do
  %w[px in pt pc Q cm mm ch ex em rem vh vw vmin vmax].each do |unit_type|
    describe "##{unit_type}" do
      it "returns integer value as a string including #{unit_type} suffix" do
        expect(16.send(unit_type)).to eq("16#{unit_type}")
      end
      
      it "returns negative integer value as a string including #{unit_type} suffix" do
        expect(-16.send(unit_type)).to eq("-16#{unit_type}")
      end
      
      it "returns float value as a string including #{unit_type} suffix" do
        expect(13.999999999998.send(unit_type)).to eq("13.999999999998#{unit_type}")
      end
      
      it "returns 0 (without px) if value is 0" do
        expect(0.send(unit_type)).to eq("0")
      end
    end
  end
  
  describe "#%" do
    it "returns integer value as a string including % suffix" do
      expect(16.%).to eq("16%")
    end
    
    it "returns negative integer value as a string including % suffix" do
      expect(-16.%).to eq("-16%")
    end
    
    it "returns float value as a string including % suffix" do
      expect(13.999999999998.%).to eq("13.999999999998%")
    end
    
    it "returns 0 (without px) if value is 0" do
      expect(0.%).to eq("0")
    end
    
    it "works according to original functionality (modulo) if other argument is provided" do
      expect(3%2).to eq(1)
    end
  end
end
