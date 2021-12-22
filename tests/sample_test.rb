require_relative "../lib/qtest"
require_relative "../lib/test_case"



class AssertionTest < TestCase
  QTest.describe "some examples" do 
    it "can pass" do 
      # actual == expected
      (1 + 1).should == 2
    end
  
    it "can fail" do
      # (1 + 1).should == 3
    end
  
    it "negative testing" do
      (1 + 1).should != 3
    end
    
  end
  
  # New rspec like syntax
  QTest.describe "RSpect like expectations" do 
    it "can expect values" do 
      # expect(1 + 1).to(eq(2))
      expect(1 + 1).to eq 2
    end
  
    it "1 + 1 not equal 3" do 
      expect(1 + 2).not_to eq(4)
    end
  
    it "different string doesn't match" do 
      expect('ruby').not_to eq('rails')
    end
  
    it "same string matches" do 
      expect('rails').to eq('rails')
    end
  end
  
  
  #macro methods ruby
  QTest.describe "AssertionTest"  do 
    it "1 + 1 = 2"  do 
      is_equal 2, 1 + 1
    end
    
  end

  #macro methods ruby
  QTest.describe "Matchers test"  do 
    it "Truthy"  do 
    end
  end
end