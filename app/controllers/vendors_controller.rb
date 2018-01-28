class VendorsController < ApplicationController
	
	#GET /vendors
	def index
		@vendors = Vendor.all
	end
	
	#GET /vendors/:id
	def show
		@vendor = Vendor.find(params[:id])
	end
	
	# GET /vendors/new
	def new
		@vendor = Vendor.new
	end


	def edit
		@vendor = Vendor.find(params[:id])
	end

	# POST /vendors
	def create
		#@vendor = Vendor.new(name: params[:vendor][:name],address: params[:vendor][:address])
		@vendor = current_user.vendors.new(vendor_params)
		
		if @vendor.save
			redirect_to @vendor
		else
			render :new
		end
	end

	def destroy
		@vendor = Vendor.find(params[:id])
		@vendor.destroy
		redirect_to vendors_path
	end

	#PUT /vendors/:id
	def update
		@vendor = Vendor.find(params[:id])
		if @vendor.update(vendor_params)
			redirect_to @vendor
		else
			render :edit
		end

	end 

	private

	def vendor_params
		params.require(:vendor).permit(:name,:address)
	end


end