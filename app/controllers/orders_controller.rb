class OrdersController < ApplicationController

  #GET /orders
	def index
		@orders = Order.all
		@title = view_context.diego
		p @title

	end
	
	#GET /orders/:id
	def show
		@order = Order.find(params[:id])
	end
	
	# GET /orders/new
	def new
		@order = Order.new
	end

	def edit
		@order = Order.find(params[:id])
	end

	# POST /orders
	def create
		#@order = Order.new(name: params[:Order][:name],address: params[:Order][:address])
		@order = Order.new(order_params)
		
		if @order.save
			redirect_to @order
		else
			render :new
		end
	end

	def destroy
		@order = Order.find(params[:id])
		@order.destroy
		redirect_to orders_path
	end

	#PUT /orders/:id
	def update
		@order = Order.find(params[:id])
		if @order.update(order_params)
			redirect_to @order
		else
			render :edit
		end

	end 

	private

	def order_params
		params.require(:order).permit(:name,:tracking_number,:address,:order_number,:vendor_id)
	end

end
