class RoomsController < ApplicationController
	before_filter :find_room, only: :show

	def show
	end

	private

	def find_room
	 	@room = Room.find_by_id(params[:id])
	end
end