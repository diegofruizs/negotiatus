class OrdersController < ApplicationController
  
  def index
	Order.all
  end
end
