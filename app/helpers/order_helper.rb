module OrderHelper
	
	def diego
		@x = Vendor.all
		return @x
	end
end
