module ApplicationHelper
	def displayAmount(amt)
		negstr = ""
		if amt < 0
			amt = -amt
			negstr = "-"
		end
		cents = amt % 100
		dollars = amt / 100
		if dollars > 0
			if cents > 0
				if cents < 10
					return negstr + "$" + dollars.to_s + ".0" + cents.to_s
				else
					return negstr + "$" + dollars.to_s + "." + cents.to_s
				end
			else
				return negstr + "$" + dollars.to_s + ".00"
			end
		else
			if cents < 10
				return negstr + "$" + "00.0" + cents.to_s
			else
				return negstr + "$" + "00." + cents.to_s
			end
		end
	end
end
