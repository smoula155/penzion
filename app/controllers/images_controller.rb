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
		        flash[:success] = 'Objednávka úspěšně vytvořena.'
		        format.html { redirect_to images_path }
		        format.json { render :show, status: :created, location: @message }
      		else
		        flash[:danger] = 'Obrázek nebyl přidán!!'
		        format.html { render :new }
		        format.json { render json: @message.errors, status: :unprocessable_entity }
      		end
    	end
  	end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    respond_to do |format|
      format.html { redirect_to images_path }
      format.json { head :no_content }
    end
  end

  def show
  end

private
	def images_params
		 params.require(:image).permit(:picture, :room_id)
	end
end
