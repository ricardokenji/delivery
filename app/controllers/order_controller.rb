class OrderController < ApplicationController 
  def create
    payload = get_payload

    order_parser = OrderParser::EatsOrderParser.new
    ProcessOrder.call(order_parser.parse(payload))
    
    render :plain => {status: 'success'}, status: 200, content_type: 'application/json'
  end

  private
  def get_payload
    file = File.read(File.join(Rails.root, 'payload.json'))
    JSON.parse(file)
  end
end
