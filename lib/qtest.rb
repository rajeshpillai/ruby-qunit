class QTest 
  def self.describe (desc, &block)
    puts desc.upcase 
    instance_eval &block
  end

  def self.it (desc, &block) 
    begin 
      $stdout.write "  - #{desc}"
      result = instance_eval &block  #block.call 
      puts " #{GREEN}(ok)#{RESET}"
    rescue Exception => e 
      puts "#{RED}(fail)#{RESET}"
      # puts e.backtrace.reverse
      # format the output
      puts [
        "#{RED}Backtract:#{RESET}",
        e.backtrace.reverse.map {|line| "#{RED}|#{RESET} #{line}"},
        "#{RED}#{e}#{RESET}"
      ].flatten.map {|line| "\t#{line}"}.join("\n")
    end
  end
  
  
  def self.is_equal(expected, actual)
    # expected == actual   # true or false
    unless actual == expected
      raise AssertionError.new(
        "Expected #{expected.inspect} but got #{actual.inspect}"
      )
    end   
  end
  
  # New feature
  def self.expect (actual) 
    Actual.new(actual)
  end
  
  
  def self.eq(expected) 
    Expectations::Equal.new(expected)
  end
end



GREEN = "\e[32m"
RED   = "\e[31m"
RESET = "\e[0m"


# Approach 1

# def it (desc, &block) 
#   result = block.call 
#   if result 
#     puts "     #{desc.ljust(40, '.')} passed"
#   else
#     puts "     #{desc.ljust(40, '.')} failed"
#   end
# end

# Approach 2
# def it (desc, &block) 
#   begin 
#     $stdout.write "  - #{desc}"
#     result = block.call 
#     puts " #{GREEN}(ok)#{RESET}"
#   rescue Exception => e 
#     puts "#{RED}(fail)#{RESET}"
#     puts e.backtrace
#     puts e 
#   end
# end


# Approach 3 - Style error message
# def it (desc, &block) 
#   begin 
#     $stdout.write "  - #{desc}"
#     result = block.call 
#     puts " #{GREEN}(ok)#{RESET}"
#   rescue Exception => e 
#     puts "#{RED}(fail)#{RESET}"
#     # puts e.backtrace.reverse
#     # format the output
#     puts [
#       "#{RED}Backtract:#{RESET}",
#       e.backtrace.reverse,
#       "#{RED}#{e}#{RESET}"
#     ].flatten.map {|line| "\t#{line}"}.join("\n")
#   end
# end


# Approach 4 - Let's put backtrace on its own line


class Actual 
  def initialize(actual) 
    @actual = actual
  end

  def to(expectation) 
    expectation.run(@actual)
  end

end

class Expectations 
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

# Open class
class Object
  def should 
    ComparisonAssertion.new(self)
  end
end

class ComparisonAssertion
  def initialize (actual)
    @actual = actual
  end

  def ==(expected)
    unless @actual == expected
      raise AssertionError.new(
        "Expected #{expected.inspect} but got #{@actual.inspect}"
      )
    end
  end

  def !=(expected)
    unless @actual != expected
      raise AssertionError.new(
        "Expected #{expected.inspect} but got #{@actual.inspect}"
      )
    end
  end
end

class AssertionError < RuntimeError

end