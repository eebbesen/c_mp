class Sample < ActiveRecord::Base
  belongs_to :citizen
  belongs_to :lake
  validates_presence_of :citizen, :lake
end
