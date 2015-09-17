require 'rails_helper'

describe User do
  before do
    @user = FactoryGirl.build(:user, email: "user1@example.com", password: "password", password_confirmation: "password")
  end

  it "gets a uid assigned" do
    @user.save!
    expect(@user.uid).not_to be_blank
  end
end