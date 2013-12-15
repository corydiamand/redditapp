require 'spec_helper'

describe Post do
  it "is invalid without a url" do
  	FactoryGirl.build(:post, url:nil).should_not be_valid
  end
end
