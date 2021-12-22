require_relative "../lib/qtest"


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
QTest.describe "expectations" do 
  it "can expect values" do 
    # expect(1 + 1).to(eq(2))
    expect(1 + 1).to eq 2
  end
end


class AssertionTest
  #macro methods ruby
  QTest.describe "AssertionTest"  do 
    it "1 + 1 = 2"  do 
      is_equal 2, 1 + 1
    end
    
  end
end

class MatchersTest
  #macro methods ruby
  QTest.describe "Matchers test"  do 
    it "Truthy"  do 
    end
    
  end
end