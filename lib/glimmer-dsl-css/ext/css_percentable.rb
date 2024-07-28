module CssPercentable
  def %(other = nil)
    if other.nil?
      if zero?
        to_s
      else
        "#{self}%"
      end
    else
      super(other)
    end
  end
end
