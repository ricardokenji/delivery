class OrderSerializer < ActiveModel::Serializer
  attributes :externalCode
  has_one :customer
  has_many :items
  has_many :payments

  def externalCode
    object.external_code
  end
end
