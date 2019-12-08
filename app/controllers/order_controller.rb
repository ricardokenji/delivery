class OrderController < ApplicationController 
  def create
    payload = get_payload

    order_parser = get_parser_for_store_id(payload['store_id'])
    ProcessOrder.call(order_parser.parse(payload))
    
    render :plain => {status: 'success'}, status: 200, content_type: 'application/json'
  end

  private
  def get_payload
    file = File.read(File.join(Rails.root, 'payload.json'))
    JSON.parse(file)
  end

  def get_parser_for_store_id(store_id)
    if(store_id == 282)
      return OrderParser::EatsOrderParser.new
    end
    raise "Unsupported store"
  end
end
