class House < ActiveRecord::Base
	validates_presence_of :name
	has_many :users
	has_many :bills
	has_many :payments
end
