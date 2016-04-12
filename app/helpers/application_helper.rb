module ApplicationHelper
	include ActionView::Helpers::NumberHelper


	def td_classes_for(day,room,start_moth)
		  unless filtr_by_rooms(room).where('from_date <= (?)',day).where('to_date > (?)',day).blank?
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
			when *Room::BOTTOM_ROOMS
		 	orders = Order.form_bottom(room.id)
			when *Room::ONE_ROOMS
			 orders = Order.form_room(room.id)
			when Room::ROOMS109110
				orders = Order.form_all_bottom_rooms
			when Room::ROOMSall
				orders = Order.all
			else
				flash[:danger] = 'Neočekávaná chyba'
				return redirect_to :back
			end
		end

		def cz_month(month)
			case month
				when 1
					'Leden'
				when 2
					'Únor'
				when 3
					 'Březen'
				when 4
					 'Duben'
				when 5
					'Květen'
				when 6
					'Červen'
				when 7
					'Červenec'
				when 8
					'Srpen'
				when 9
					'Září'
				when 10
					'Říjen'
				when 11
					'Listopad'
				when 12
					'Prosinec'
			end
		end


end
