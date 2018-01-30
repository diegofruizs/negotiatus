class OrdersController < ApplicationController

before_action :authenticate_user!

  #GET /orders
	def index
		@orders = Order.paginate(page: params[:page],per_page: 20).all.order(:created_at)
		calculate_deliveries
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


	#HardWorker.perform_async('bob', 5)


	def calculate_deliveries
		@orders.each do |i|

		 a = DateTime::now 
		 b = DateTime.new(i.created_at.year.to_i,i.created_at.month.to_i,i.created_at.day.to_i,i.created_at.hour.to_i,i.created_at.min.to_i,i.created_at.sec.to_i,'-5')
         
         diff = a.to_time - b.to_time
         
         minutes_from_created = diff / 60

         if minutes_from_created > 0 
	         if minutes_from_created < 720 #12 hours
	         	i.update_attribute(:message, 'Normal')
	         	i.update_attribute(:time_min, minutes_from_created)
	         elsif minutes_from_created < 1440 #24 hours
	         	i.update_attribute(:message, 'Not Normal')
	         	i.update_attribute(:time_min, minutes_from_created)
	         else 
	         	if minutes_from_created > 1440 
		         	# more than 24 hrs
		         	i.update_attribute(:message, 'Very Late')
		         	i.update_attribute(:time_min, minutes_from_created)
	         	end
			end
		else
			i.update_attribute(:message, 'Processing')
		    i.update_attribute(:time_min, 0)
		end
	end
	end
end
