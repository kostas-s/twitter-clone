require 'rails_helper'

# create_table "users", force: :cascade do |t|
#   t.string "email", default: "", null: false
#   t.string "encrypted_password", default: "", null: false
#   t.string "reset_password_token"
#   t.datetime "reset_password_sent_at"
#   t.datetime "remember_created_at"
#   t.datetime "created_at", precision: 6, null: false
#   t.datetime "updated_at", precision: 6, null: false
#   t.string "name"
#   t.string "username"
#   t.index ["email"], name: "index_users_on_email", unique: true
#   t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
#   t.index ["username"], name: "index_users_on_username", unique: true

RSpec.describe User, type: :model do

  it "is invalid without an email" do
    u = User.new(name:"Kostas", username:"@kostas", password:"test1234")
    u.valid?
    expect(u.errors[:email]).to include("can't be blank")
  end

  it "is invalid without a name" do
    u = User.new(email:"Kostas@kost.com", username:"@kostas", password:"test1234")
    u.valid?
    expect(u.errors[:name]).to include("can't be blank")
  end

  it "is invalid without a username" do
    u = User.new(name:"Kostas", email:"kots@kots.com", password:"test1234")
    u.valid?
    expect(u.errors[:username]).to include("can't be blank")
  end

  it "is invalid without a password" do
    u = User.new(name:"Kostas", username:"@kostas", email:"kots@kots.com")
    u.valid?
    expect(u.errors[:password]).to include("can't be blank")
  end

  it "is invalid if username already taken" do
    User.create(name:"Maria", username:"@maria", email:"maria@maria.com", password:"maria1234")
    u = User.new(name:"maria2", username:"@maria", email:"maria@mary.gr", password:"maria1234")
    u.valid?
    expect(u.errors[:username]).to include("has already been taken")
  end
end
