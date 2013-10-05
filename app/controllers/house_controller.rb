class HouseController < ApplicationController
  def index
    @houses = House.all
  end

  def show
    @house = House.find(params[:id])
    @users = @house.users
    @bills = @house.bills
    @payments = @house.payments
    @user = User.new
  end

  def new
    @house = House.new
  end

  def create
    @house = House.new(params[:house].permit(:name))

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

  def save_user
   
    @user = User.new(params[:user].permit(:username, :email, :balance, :house_id))
     respond_to do |format|
      if @user.save
        format.html { redirect_to @user.house, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
  end

  def update
  end
end
