class OrdersNotifierJob < ApplicationJob
  queue_as :default

  def perform(message)
    puts "**********"
    puts message
    puts "**********"
  end
end
