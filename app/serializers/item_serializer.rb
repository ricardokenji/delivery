class ItemSerializer < ActiveModel::Serializer
  attributes :externalCode, :name, :price, :quantity, :total

  def externalCode
    object.external_code
  end
end
