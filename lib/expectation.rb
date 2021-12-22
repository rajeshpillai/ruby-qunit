class Expectation 
  def initialize(actual) 
    @actual = actual
  end

  def to(matcher) 
    unless matcher.run(@actual)
      raise AssertionError.new(
        matcher.message
      )
    end   
    
  end

  def not_to(matcher) 
    if matcher.run(@actual, "Not ")
      raise AssertionError.new(
        matcher.message
      )
    end   
  end

end