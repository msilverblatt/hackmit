module ApplicationHelper
	def displayAmount(amt)
		cents = amt % 100
		dollars = amt / 100
		if dollars > 0
			if cents > 0
				if cents < 10
					return "$" + dollars.to_s + ".0" + cents.to_s
				else
					return "$" + dollars.to_s + "." + cents.to_s
				end
			else
				return "$" + dollars.to_s + ".00"
			end
		else
			if cents < 10
				return "$" + "00.0" + cents.to_s
			else
				return "$" + "00." + cents.to_s
			end
		end
	end
end
