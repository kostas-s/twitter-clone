require 'rails_helper'

RSpec.describe Tweet, type: :model do

  before do
    @valid_user = User.create(name:"Kost", username:"@kost", email:"k@m.com", password:"test1234")
  end

  it "can't create empty tweet" do
    t = Tweet.new
    t.valid?
    expect(t).to be_invalid
  end

  it "can create a tweet" do
    t = @valid_user.tweets.build(tweet:"hello worldddd!!")
    t.valid?
    expect(t).to be_valid
  end

  it "can't create tweet shorter than 10 characters" do
    body = ""
    "A".upto("D").each do |letter|
      body += letter
      t = @valid_user.tweets.build(tweet:body)
      t.valid?
      expect(t.errors[:tweet]).to include("is too short (minimum is 5 characters)")
    end
  end

  it "can't create tweet longer than 160 characters" do
    body = "A"*161
    t = @valid_user.tweets.build(tweet:body)
    t.valid?
    expect(t.errors[:tweet]).to include("is too long (maximum is 160 characters)")
  end

  it "can't create tweet without a user id" do
    t = Tweet.new(tweet:"Hello World!!")
    t.valid?
    expect(t.errors[:user]).to include("must exist")
  end

end
