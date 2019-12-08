require 'httparty'

module DeliveryCenter
  class Client
    include HTTParty
    base_uri 'https://delivery-center-recruitment-ap.herokuapp.com'

    def process(order)
      options = {
        body: order,
        headers: {
          'X-Sent'=> Time.now.strftime("%I\h%M %d/%m/%Y"),
          'Content-Type' => 'application/json'
        }
      }
      response = self.class.post("/", options)

      handle_response(response)
    end

    private
    def handle_response(response)
      if(response.code != 200)
        raise "API returned error: #{response.body}"
      end
    end
  end
end