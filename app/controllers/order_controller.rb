class OrderController < ApplicationController 
  def create
    payload = get_payload

    ProcessOrder.call(payload)
    
    render :plain => {status: 'success'}, status: 200, content_type: 'application/json'
  rescue ProcessOrderError => e
    render json: {
      error: e.message
    }, status: :bad_request
  end

  private
  def get_payload
    file = File.read(File.join(Rails.root, 'payload.json'))
    JSON.parse(file)
  end
end
