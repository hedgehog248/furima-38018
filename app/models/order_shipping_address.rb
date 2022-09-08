class OrderShippingAddress
  include ActiveModel::Model
  attr_accessor :token, :item_id, :user_id, :postal_code, :area_id, :city, :address, :building, :tel

  with_options presence: true do
    validates :token
    validates :item_id
    validates :user_id
    validates :postal_code, format: {with: /\A\d{3}-\d{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :address
    validates :tel, format: {with: /\A\d{10,11}\z/, message: "is invalid. Don't include hyphen(-)"}
  end
  validates :area_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    binding.pry
    order = Order.create(item_id: item_id, user_id: user_id)
    ShippingAddress.create(postal_code: postal_code, area_id: area_id, city: city, address: address, building: building, tel: tel, order_id: order.id)
  end
end