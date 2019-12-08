class Item < ApplicationRecord
  attribute :external_code, :string
  attribute :name, :string
  attribute :price, :decimal
  attribute :quantity, :integer
  attribute :total, :decimal
end
