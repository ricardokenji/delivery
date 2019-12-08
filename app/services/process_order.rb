class ProcessOrder
  def self.call(order)
    order.save()
    client = DeliveryCenter::Client.new
    json = ActiveModelSerializers::SerializableResource.new(order).to_json
    client.process(json)
    order.processed!
  rescue StandardError => error
    order.error!
    Log.new(order_id: order.id, status: order.status, message: error.message ).save()
  end
end