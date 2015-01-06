require File.dirname(__FILE__) + '/../spec_helper'

describe Authentication do
  it "should be valid" do
    expect(Authentication.new).to be_valid
  end
end
