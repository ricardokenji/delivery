module OrderParser
  class EatsOrderParser < BaseOrderParser
    def parse(payload)
      order = build_order(payload)

      order.customer = build_customer(payload['buyer'])

      payload['order_items'].each do |item_payload|
        order.items << build_item(item_payload)
      end

      payload['payments'].each do |payment_payload|
        order.payments << build_payment(payment_payload)
      end
    
      order
    end

    private 
    def build_order(payload)
      order = Order.new

      payload_address = payload['shipping']['receiver_address']
      
      order.external_code = payload['id']
      order.store_id = payload['store_id']
      order.sub_total = payload['total_amount']
      order.delivery_fee = payload['total_shipping']
      order.total = payload['total_amount_with_shipping']
      order.country = payload_address['country']['id']
      order.state = payload_address['state']['name']
      order.city = payload_address['city']['name']
      order.district = payload_address['neighborhood']['name']
      order.street = payload_address['address_line']
      order.complement = payload_address['']
      order.latitude = payload_address['latitude']
      order.longitude = payload_address['longitude']
      order.dt_order_create = payload['date_created']
      order.postal_code = payload_address['zip_code']
      order.number = payload['number']
      order
    end

    def build_item(item_payload)
      item = Item.new
      item.external_code = item_payload['item']['id']
      item.name = item_payload['item']['title']
      item.price = item_payload['unit_price']
      item.quantity = item_payload['quantity']
      item.total = item_payload['full_unit_price']
      item
    end

    def build_customer(customer_payload)
      customer = Customer.new
      customer.external_code = customer_payload['id']
      customer.first_name = customer_payload['first_name']
      customer.last_name = customer_payload['last_name']
      customer.email = customer_payload['email']
      customer.phone_area_code = customer_payload['phone']['area_code']
      customer.phone_number = customer_payload['phone']['number']
      customer
    end

    def build_payment(payment_payload)
      payment = Payment.new
      payment.type = payment_payload['payment_type']
      payment.value = payment_payload['installment_amount']
      payment
    end
  end
end