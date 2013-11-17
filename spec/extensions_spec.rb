require_relative('./spec_helper')

describe "String extensions" do

  class Dummy
  end

  it "should respond to #contantize" do
    "String".should respond_to(:constantize)
  end

  it "should return the constant" do
    "Dummy".constantize.should == Dummy
  end

end