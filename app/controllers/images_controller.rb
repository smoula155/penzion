class ImagesController < ApplicationController

	def index
		@images= Image.all
	end
	def new
		@image = Image.new
	end


	def create
		@image = Image.new(images_params)
		respond_to do |format|
      		if @image.save
		        flash[:success] = 'Obědnávka úspěšně vytvořena.'
		        format.html { redirect_to images_path }
		        format.json { render :show, status: :created, location: @message }
      		else
		        flash[:danger] = 'Obrázek nebyl přidán!!'
		        format.html { render :new }
		        format.json { render json: @message.errors, status: :unprocessable_entity }
      		end
    	end
  	end

private
	def images_params
		 params.require(:image).permit(:picture, :room_id)
	end
end
