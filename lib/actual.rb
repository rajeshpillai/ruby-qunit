class Actual 
  def initialize(actual) 
    @actual = actual
  end

  def to(expectation) 
    expectation.run(@actual)
  end

end