class ProcessOrder
  def self.call(payload)
    order = parse(payload)
    order.save()
    process(order)
  rescue StandardError => error
    order.error!
    Log.new(order_id: order.id, status: order.status, message: error.message ).save()
    raise ProcessOrderError.new
  end

  private 
  def self.parse(payload)
    order_parser = OrderParser::EatsOrderParser.new
    order = order_parser.parse(payload)
  end

  def self.process(order) 
    json = ActiveModelSerializers::SerializableResource.new(order).to_json
    puts json
    client = DeliveryCenter::Client.new
    client.process(json)
    order.processed!
  end
end