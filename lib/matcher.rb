class Matcher 
  class Equal 
    def initialize(expected) 
      @expected = expected
    end

    def run (actual) 
      unless actual == @expected
        raise AssertionError.new(
          "Expected #{@expected.inspect} but got #{actual.inspect}"
        )
      end   
    end
  end
end