class Sample < ActiveRecord::Base
  belongs_to :citizen
  belongs_to :lake
  validates_presence_of :citizen, :lake

  enum physical_appearance: [ :'crystal clear', :'tea colored', :cloudy, :green, :brown ]
  enum recreational_suitability: [ :beautiful, :'minor problem', :'slightly impaired', :'substantially reduced', :impossible ]

end
