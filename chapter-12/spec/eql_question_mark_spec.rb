require 'equality_object'

describe EqualityObject do
  let(:equalityTester) { EqualityObject.new }
  let(:alteredString) { AlteredString.new }

  context "How 'eql?' compares objects" do
    it "Will return false if the objects do NOT equal each other" do
      x = "NOT_string"
      y = "string"
      equalityTester.eql_question_mark(x, y).should == false 
    end

    it "Will return true if the objects do NOT share the same memory location" do
      x = "string"
      y = "string"
      equalityTester.eql_question_mark(x, y).should == true 
    end
    
    it "Will return true if the objects share the same memory location" do
      x = "string"
      y = x
      equalityTester.eql_question_mark(x, y).should == true
    end

    it "Will return false if the objects share a common ancestor and do NOT contain the same string" do
      alteredString = "string"
      x = "NOT_string"
      equalityTester.eql_question_mark(alteredString, x).should == false
    end

    it "Will return true if the objects share a common ancestor and contain the same strings" do
      alteredString = "string"
      x = "string"
      equalityTester.eql_question_mark(x, alteredString).should == true 
    end

    it "Will return true if the objects share a common ancestor and contain the same string" do
      alteredString = "string"
      x = "string"
      equalityTester.eql_question_mark(alteredString, x).should == true 
    end
  end
end
