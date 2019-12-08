class Log < ApplicationRecord
  attribute :order_id, :integer
  attribute :status, :string
  attribute :message, :string
end
