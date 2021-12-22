require_relative "object"
require_relative "expectation"
require_relative "matcher"
require_relative "assertion_error"


GREEN = "\e[32m"
RED   = "\e[31m"
RESET = "\e[0m"

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
    Expectation.new(actual)
  end
  
  
  def self.eq(expected) 
    Matcher::Equal.new(expected)
  end

end







