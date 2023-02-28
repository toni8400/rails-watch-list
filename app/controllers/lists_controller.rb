class ListsController < ApplicationController
# index, show, new create
  def index
    @lists = List.all
  end

  def show
    # @restaurant = Restaurant.find(params[:id])
    @list = List.find(params[:id])

  end

  def new
    @list = List.new
  end

  def create
    # @restaurant = Restaurant.new(params[:restaurant])
    # @restaurant.save
    @list = List.new(list_params)

    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end

end
