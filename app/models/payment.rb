class Payment < ApplicationRecord
  attribute :type, :string
  attribute :value, :decimal
end
