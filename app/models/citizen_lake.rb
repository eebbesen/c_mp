class CitizenLake < ActiveRecord::Base
  belongs_to :citizen
  belongs_to :lake
end
