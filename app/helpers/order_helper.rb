module OrderHelper

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


  def order_status(status)
    case status
      when Order::STATUS_NEW
        'Nová obědnávka'
      when Order::STATUS_ELABORATED
        'Čeká na zaplacení'
      when Order::STATUS_FINISHED
        'Uzavřená'
      when Order::STATUS_REJECTED
        'Zamítnutá'
      else
        'nedef'
    end 
  end
end
