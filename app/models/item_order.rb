class ItemOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :region_id, :municipalities, :banchi, :building_name, :number, :token

  with_options presence: true do
    validates :user_id, :item_id, :municipalities, :token

    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :region_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :banchi
    validates :number, format: { with: /\A\d{10,11}\z/, message: 'is invalid' }

  end
  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Address.create(order_id: order.id, post_code: post_code, region_id: region_id, municipalities: municipalities, banchi: banchi, building_name: building_name, number: number)
  end
end