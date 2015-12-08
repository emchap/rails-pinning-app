class PinsController < ApplicationController
  
  def index
    @pins = Pin.all
  end
  
  def show
    @pin = Pin.find(params[:id])
  end
  
  def show_by_name
  	@pin = Pin.where(slug: params[:slug])[0]
  	render :show
  end
  
  def new
  	@pin = Pin.new
  end
  
  def create
    @pin = Pin.create(pin_params)

    if @pin.valid?
      @pin.save
      #render :show
      #redirect_to pin_by_name_path(slug: @pin.slug)
      redirect_to pin_path(@pin)
    else
      @errors = @pin.errors
      render :new
    end
  end
private
  def pin_params
    params.require(:pin).permit(:title, :url, :slug, :text, :category_id)
  end

end