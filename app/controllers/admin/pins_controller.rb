class Admin::PinsController < Admin::BaseController

  def index
    @pins = Pin.paginate(page: params[:page])
  end

  def new
    @pin = Pin.new
  end

  def create
    @pin = Pin.new(pin_params)
    if @pin.save
      flash[:success] = 'Your pin has been created!'
      redirect_to admin_pins_url
    else
      render :new
    end
  end

  def edit
    @pin = Pin.find(params[:id])
  end

  def update
    @pin = Pin.find(params[:id])
    if @pin.update(pin_params)
      flash[:success] = 'Your pin has been updated!'
      redirect_to admin_pins_url
    else
      render :edit
    end
  end


  private

  def pin_params
    # We require the params to have a category and we permit it to have a name and a slug
    params.require(:pin).permit(:title, :summary, :board_id, :image)
  end

end
