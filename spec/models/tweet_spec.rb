require 'rails_helper'

RSpec.describe Tweet, type: :model do
  #this should not be the case!!
  it "can create empty tweet" do
    t = Tweet.new
    t.valid?
    expect(t).to be_valid
  end

  it "can't create empty tweet"
  it "can't create tweet without a user id"
  it "tweet with user id and message is valid"
end
