class ItemOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :region_id, :municipalities, :banchi, :building_name, :number, :purchase

    validates :user_id, presence: true
    validates :item_id, presence: true

    validates :post_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :region_id, presence: true, numericality: { other_than: 0, message: "can't be blank" }
    validates :municipalities, presence: true
    validates :banchi, presence: true
    validates :number, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }

    validates :purchase, presence: true

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Address.create(order_id: order.id, post_code: post_code, region_id: region_id, municipalities: municipalities, banchi: banchi, building_name: building_name, number: number)
  end
end