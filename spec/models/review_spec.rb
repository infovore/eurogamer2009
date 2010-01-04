require 'spec_helper'

describe Review do
  before(:each) do
    @valid_attributes = {
      
    }
  end

  it "should create a new instance given valid attributes" do
    Review.create!(@valid_attributes)
  end
end
