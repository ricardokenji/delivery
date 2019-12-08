class ProcessOrder
  def self.call(order)
    client = DeliveryCenter::Client.new
    json = ActiveModelSerializers::SerializableResource.new(order, adapter: :json).as_json
    client.process(json)

  end
end