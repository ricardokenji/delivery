class Customer < ApplicationRecord
  attribute :external_code, :string
  attribute :first_name, :string
  attribute :last_name, :string
  attribute :email, :string
  attribute :phone_area_code, :string
  attribute :phone_number, :string
end
