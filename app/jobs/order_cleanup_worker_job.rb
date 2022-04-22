class OrderCleanupWorkerJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Order.clean_unpaid_orders
  end
end
