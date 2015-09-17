FactoryGirl.define do

  factory :role_registered, class: Role do
    name Role::NAMES[:registered]
  end

  factory :role_admin, class: Role do
    name Role::NAMES[:admin]
  end

end