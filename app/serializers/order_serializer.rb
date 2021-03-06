class OrderSerializer < ActiveModel::Serializer
  attributes :externalCode, :storeId, :subTotal, :deliveryFee, :total, :country, :state, :city, 
  :district, :street, :complement, :latitude, :longitude, :dtOrderCreate, :postalCode, :number,
  :total_shipping

  has_one :customer
  has_many :items
  has_many :payments

  def externalCode
    object.external_code
  end

  def storeId
    object.store_id
  end

  def subTotal
    object.sub_total
  end

  def deliveryFee
    object.delivery_fee
  end

  def dtOrderCreate
    object.dt_order_create.iso8601
  end

  def postalCode
    object.postal_code
  end

  def total_shipping
    object.delivery_fee
  end
end
