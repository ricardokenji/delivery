RSpec.describe OrderParser::EatsOrderParser do
  describe "Post parse" do
    before(:each) do
      file = file_fixture("payload.json").read
      @json = JSON.parse(file)
      @json_address = @json['shipping']['receiver_address']
      @json_item = @json['order_items'].first
      @json_payment = @json['payments'].first
      @json_customer = @json['buyer']

      order_parser = OrderParser::EatsOrderParser.new
      @order = order_parser.parse(@json)
    end

    it "Should have order.external_code that matches" do
      expect(@order.external_code).to eq(@json['id'].to_s)
    end

    it "Should have order.store_id that matches" do
      expect(@order.store_id).to eq(@json['store_id'].to_s)
    end

    it "Should have order.sub_total that matches" do
      expect(@order.sub_total).to eq(@json['total_amount'])
    end

    it "Should have order.delivery_fee that matches" do
      expect(@order.delivery_fee).to eq(@json['total_shipping'])
    end

    it "Should have order.total that matches" do
      expect(@order.total).to eq(@json['total_amount_with_shipping'])
    end

    it "Should have order.country that matches" do
      expect(@order.country).to eq(@json_address['country']['id'])
    end

    it "Should have order.state that matches" do
      expect(@order.state).to eq(@json_address['state']['name'])
    end

    it "Should have order.city that matches" do
      expect(@order.city).to eq(@json_address['city']['name'])
    end

    it "Should have order.district that matches" do
      expect(@order.district).to eq(@json_address['neighborhood']['name'])
    end

    it "Should have order.street that matches" do
      expect(@order.street).to eq(@json_address['address_line'])
    end

    it "Should have order.complement that matches" do
      expect(@order.complement).to eq(@json_address['comment'])
    end

    it "Should have order.latitude that matches" do
      expect(@order.latitude).to eq(@json_address['latitude'])
    end

    it "Should have order.longitude that matches" do
      expect(@order.longitude).to eq(@json_address['longitude'])
    end

    it "Should have order.dt_order_create that matches" do
      expect(@order.dt_order_create).to eq(@json['date_created'])
    end

    it "Should have order.postal_code that matches" do
      expect(@order.postal_code).to eq(@json_address['zip_code'])
    end

    it "Should have order.number that matches" do
      expect(@order.number).to eq(@json_address['street_number'])
    end

    it "Should have order.status that matches" do
      expect(@order.status).to eq('pending')
    end
     
    it "Should have items.external_code that matches" do
      expect(@order.items.first.external_code).to eq(@json_item['item']['id'])
    end

    it "Should have items.name that matches" do
      expect(@order.items.first.name).to eq(@json_item['item']['title'])
    end

    it "Should have items.price that matches" do
      expect(@order.items.first.price).to eq(@json_item['unit_price'])
    end

    it "Should have items.quantity that matches" do
      expect(@order.items.first.quantity).to eq(@json_item['quantity'])
    end

    it "Should have items.total that matches" do
      expect(@order.items.first.total).to eq(@json_item['full_unit_price'])
    end

    it "Should have customer.storexternal_codee_id that matches" do
      expect(@order.customer.external_code).to eq(@json_customer['id'].to_s)
    end

    it "Should have customer.first_name that matches" do
      expect(@order.customer.first_name).to eq(@json_customer['first_name'])
    end

    it "Should have customer.last_name that matches" do
      expect(@order.customer.last_name).to eq(@json_customer['last_name'])
    end

    it "Should have customer.email that matches" do
      expect(@order.customer.email).to eq(@json_customer['email'])
    end

    it "Should have customer.phone_area_code that matches" do
      expect(@order.customer.phone_area_code).to eq(@json_customer['phone']['area_code'].to_s)
    end

    it "Should have customer.phone_number that matches" do
      expect(@order.customer.phone_number).to eq(@json_customer['phone']['number'])
    end

    it "Should have payments.type that matches" do
      expect(@order.payments.first.type).to eq(@json_payment['payment_type'])
    end

    it "Should have payments.value that matches" do
      expect(@order.payments.first.value).to eq(@json_payment['installment_amount'])
    end
  end 
end