class Role < ActiveRecord::Base
  has_many :users
  NAMES = {:registered => 'registered', :banned => 'banned', :admin => 'admin'}
end
