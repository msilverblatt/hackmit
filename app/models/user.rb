class User < ActiveRecord::Base
	validates_presence_of :username, :email, :house_id
	belongs_to :house
	has_many :bills
end
