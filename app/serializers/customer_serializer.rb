class CustomerSerializer < ActiveModel::Serializer
  attributes :externalCode, :name, :email, :contact

  def externalCode
    object.external_code
  end

  def name
    "#{object.first_name} #{object.last_name}"
  end

  def contact
    "#{object.phone_area_code}#{object.phone_number}"
  end
end