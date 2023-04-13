class ItemOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :region_id, :municipalities, :banchi, :building_name, :number, :token

    validates :user_id, presence: true
    validates :item_id, presence: true

    validates :post_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :region_id, presence: true, numericality: { other_than: 0, message: "can't be blank" }
    validates :municipalities, presence: true
    validates :banchi, presence: true
    validates :number, presence: true, format: { with: /\A\d{10,11}\z/, message: 'is invalid' }

    validates :token, presence: true

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Address.create(order_id: order.id, post_code: post_code, region_id: region_id, municipalities: municipalities, banchi: banchi, building_name: building_name, number: number)
  end
end