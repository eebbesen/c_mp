class Citizen < ActiveRecord::Base
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :phone_1
  validates_presence_of :email
end
