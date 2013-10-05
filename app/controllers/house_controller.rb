class HouseController < ApplicationController
  def index
    @houses = House.all
  end

  def show
    @house = House.find(params[:id])
    @users = @house.users
    @bills = @house.bills
    @payments = @house.payments
  end

  def new
    @house = House.new
  end

  def create
    @house = House.new(house_params)

    respond_to do |format|
      if @house.save
        format.html { redirect_to @house, notice: 'House was successfully created.' }
        format.json { render action: 'show', status: :created, location: @house }
      else
        format.html { render action: 'new' }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  def update
  end
end
