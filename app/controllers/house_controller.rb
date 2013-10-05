class HouseController < ApplicationController
  def index
    @houses = House.all
  end

  def show
    @house = House.find(params[:id])
    @users = @house.users
#    @users = User.where(:house_id => @house.id)
  end

  def create
  end

  def destroy
  end

  def update
  end
end
