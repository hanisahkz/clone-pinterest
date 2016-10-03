class PinsController < ApplicationController

  before_action :find_pin, only: [:show, :edit, :update, :destroy]

  def index
    @pins = Pin.all.order("created_at DESC")
  end

  def new
    # @pin = Pin.new #without association
    # with association, you need to build a new pin from a 'current user'
    @pin = current_user.pins.build
  end

  def create
    # @pin = Pin.new(pin_params) #without association 
    @pin = current_user.pins.build(pin_params) #with association 

    if @pin.save
      redirect_to @pin, notice: "Successfully created pin!"
    else
      render 'new'
    end
  end

  def show
  #   # @pin = Pin.find(params[:id]) # however, using find_pin + before_action callback will not necessitate defining Pin.find(params[:id]) anymore
  end

  def edit
    #before_action has been done here
  end

  def update
    #before_action has been done here

    if @pin.update(pin_params)
      redirect_to @pin, notice: "Pin successfully updated"
    else 
      render 'edit'
    end
  end

  def destroy
    #before_action has been done here
    @pin.destroy
    redirect_to root_path
  end

  private

  def pin_params
    params.require(:pin).permit(:title, :description, :image)
  end

  def find_pin
    @pin = Pin.find(params[:id])
  end

end
