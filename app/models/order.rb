class Order < ApplicationRecord
    enum status: {pending: "pending", processed: 'processed', error: 'error'}

    attribute :id, :integer
    attribute :external_code, :string
    attribute :store_id, :string
    attribute :sub_total, :decimal
    attribute :delivery_fee, :decimal
    attribute :total, :decimal
    attribute :country, :string
    attribute :state, :string
    attribute :city, :string
    attribute :district, :string
    attribute :street, :string
    attribute :complement, :string
    attribute :latitude, :decimal
    attribute :longitude, :decimal
    attribute :dt_order_create, :datetime
    attribute :postal_code, :string
    attribute :number, :string
    attribute :status, :string

    has_one :customer, autosave: true
    has_many :items, autosave: true
    has_many :payments, autosave: true
end
