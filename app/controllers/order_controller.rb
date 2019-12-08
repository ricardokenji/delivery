class OrderController < ApplicationController
  def create
    payload = get_payload
    order = OrderParser.call(payload)
    render :plain => order, status: 200, content_type: 'application/json'
  end

  private
  def get_payload
    file = File.read(File.join(Rails.root, 'payload.json'))
  end
end
