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
    @bill = Bill.new
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

  def save_attr
      if params[:user]
          save_user
      elsif params[:bill]
          save_bill
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

  def save_bill
    @bill = Bill.new(params[:bill].permit(:user_id, :house_id, :title, :description, :amount))
    @bill.amount = @bill.amount * 100
    if @bill.save
      @bill.house.users.each do |u|
        if u.id == @bill.user_id
          User.update(u.id, :balance => (u.balance + ((@bill.amount / @bill.house.users.count)  * (@bill.house.users.count - 1))))
#          u.balance += (@bill.amount * ((@bill.house.users.count - 1) / @bill.house.users.count))
        else
          User.update(u.id, :balance => (u.balance - (@bill.amount / @bill.house.users.count)))
#          u.balance -= (@bill.amount / @bill.house.users.count)
        end
#        u.save
      end
      redirect_to @bill.house
    else 
  #    flash[:error] "ERROR"
    end
  end

  def destroy
  end

  def update
  end
end
