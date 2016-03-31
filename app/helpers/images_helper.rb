module ImagesHelper
  def rooms_name(type_room)
		case type_room
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
  				'nedefinovaný'
  		end
	end
end
