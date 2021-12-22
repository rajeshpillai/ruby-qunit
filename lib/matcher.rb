class Matcher 
  class Equal 
    def initialize(expected) 
      @expected = expected
    end

    def run (actual, message = "" ) 
      @actual = actual
      @default_msg = "Expected #{@expected.inspect} but got #{@actual.inspect}"
      @default_msg = message + @default_msg
      actual.eql?(@expected)
      
    end

    def message 
      @default_msg
    end
  end
end