RSpec.describe OrderParser::EatsOrderParser do
  describe "Post parse" do
    it "Should Parse" do
      file = file_fixture("payload.json").read
      json = JSON.parse(file)
      json_address = json['shipping']['receiver_address']

      order_parser = OrderParser::EatsOrderParser.new
      order = order_parser.parse(json)

      expect(order.external_code).to eq(json['id'].to_s)
      expect(order.store_id).to eq(json['store_id'].to_s)
      expect(order.sub_total).to eq(json['total_amount'])
      expect(order.delivery_fee).to eq(json['total_shipping'])
      expect(order.total).to eq(json['total_amount_with_shipping'])
      expect(order.country).to eq(json_address['country']['id'])
      expect(order.state).to eq(json_address['state']['name'])
      expect(order.city).to eq(json_address['city']['name'])
      expect(order.district).to eq(json_address['neighborhood']['name'])
      expect(order.street).to eq(json_address['address_line'])
      expect(order.complement).to eq(json_address['comment'])
      expect(order.latitude).to eq(json_address['latitude'])
      expect(order.longitude).to eq(json_address['longitude'])
      expect(order.dt_order_create).to eq(json['date_created'])
      expect(order.postal_code).to eq(json_address['zip_code'])
      expect(order.number).to eq(json_address['street_number'])
      expect(order.status).to eq('pending')
     
      json_item = json['order_items'].first
      expect(order.items.first.external_code).to eq(json_item['item']['id'])
      expect(order.items.first.name).to eq(json_item['item']['title'])
      expect(order.items.first.price).to eq(json_item['unit_price'])
      expect(order.items.first.quantity).to eq(json_item['quantity'])
      expect(order.items.first.total).to eq(json_item['full_unit_price'])

      json_customer = json['buyer']
      expect(order.customer.external_code).to eq(json_customer['id'].to_s)
      expect(order.customer.first_name).to eq(json_customer['first_name'])
      expect(order.customer.last_name).to eq(json_customer['last_name'])
      expect(order.customer.email).to eq(json_customer['email'])
      expect(order.customer.phone_area_code).to eq(json_customer['phone']['area_code'].to_s)
      expect(order.customer.phone_number).to eq(json_customer['phone']['number'])

      json_payment = json['payments'].first
      expect(order.payments.first.type).to eq(json_payment['payment_type'])
      expect(order.payments.first.value).to eq(json_payment['installment_amount'])
    end
  end 
end