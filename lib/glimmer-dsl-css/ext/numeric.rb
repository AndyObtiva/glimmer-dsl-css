class Numeric
  %w[px in pt pc Q cm mm ch ex em rem vh vw vmin vmax].each do |unit_type|
    if 1.respond_to?(unit_type)
      puts "Unable to define Numeric##{unit_type} method because it is already defined. Please avoid using the Glimmer Numeric##{unit_type} method or remove the other implementation of it!"
    else
      define_method(unit_type) do
        if zero?
          to_s
        else
          "#{self}#{unit_type}"
        end
      end
    end
  end
end
