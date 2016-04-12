class Room < ActiveRecord::Base
  has_many :orders
  has_many :images

  ROOMS109 = 1
  ROOMS110 = 2
  ROOMS111 = 3
  ROOMS112 = 4
  ROOMS109110 = 5
  ROOMSall = 6
  TYPE_ROOMS = [['apartmán 109',ROOMS109],['apartmán 110',ROOMS110],['apartmán 111',ROOMS111],['apartmán 112',ROOMS112],['spodní patro',ROOMS109110],['celý penzion',ROOMSall]]

  ONE_ROOMS = [ROOMS111, ROOMS112]
  BOTTOM_ROOMS = [ROOMS109, ROOMS110 ]

  def name_room(type=self.id)
		case type
		when Room::ROOMS109
			'Apartmán 109'
		when Room::ROOMS110
			'Apartmán 110'
		when Room::ROOMS111
			'Apartmán 111'
		when Room::ROOMS112
			'Apartmán 112'
		when Room::ROOMS109110
			'Spodní patro'
		when Room::ROOMSall
			'Celý penzion'
		else
			'nondef'
		end
	end


end
