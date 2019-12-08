class ProcessOrder
  def self.call(order)
    client = DeliveryCenter::Client.new
    json = ActiveModelSerializers::SerializableResource.new(order).to_json
    client.process(json)
  end
end