class Citizen < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :phone_1
  validates_presence_of :email

  has_many :citizen_lakes
end
