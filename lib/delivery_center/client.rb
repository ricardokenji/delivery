require 'httparty'

module DeliveryCenter
  class Client
    include HTTParty
    base_uri 'https://delivery-center-recruitment-ap.herokuapp.com'

    def process(order)
      options = {
        body: order,
        headers: {"X-Sent" => Time.now.strftime("%I\h%M %d/%m/%Y")}
      }
      raise options.inspect
      #self.class.post('https://delivery-center-recruitment-ap.herokuapp.com', options)
    end
  end
end