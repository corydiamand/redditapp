require 'spec_helper'

describe Page do
  it "is invalid without a url" do
  	FactoryGirl.build(:page, url:nil).should_not be_valid
  end
end
