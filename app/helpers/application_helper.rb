module ApplicationHelper
	include ActionView::Helpers::NumberHelper


	def td_classes_for(day,room,start_moth)
		  unless filtr_by_rooms(room).where('from_date = (?)', day).blank?
				return 'has-events'
			end
			if day.to_date.month < start_moth || day.to_date.month > start_moth
				return 'next-month'
			end

			if day == Date.today
				return 'today'
			end
	end

	def filtr_by_rooms(room)
		case room.typ
			when *Room::ONE_ROOMS
			 orders = Order.form_room(room.id)
			when Room::ROOMS109110
				orders = Order.form_all_bottom_rooms
			when Room::ROOMSall
				orders = Order.form_all_rooms
			else
				flash[:danger] = 'Neočekávaná chyba'
				return redirect_to :back
			end
		end


end
