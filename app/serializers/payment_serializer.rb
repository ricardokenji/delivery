class PaymentSerializer < ActiveModel::Serializer
  attributes :type, :value

  def type
    object.type.upcase
  end
end
