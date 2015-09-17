FactoryGirl.define do

  factory :user  do
    email "user@example.com"
    password "password"
    password_confirmation { password }
    role do
      FactoryGirl.create(:role_registered)
    end
    factory :confirmed_user do
      confirmed_at Time.zone.now
    end
  end
end