class ItemPurchase
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :region_id, :municipalities, :banchi, :building_name, :number, :purchase

    validates :user_id, presence: true
    validates :item_id, presence: true

    validates :postcode, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :region_id, presence: true, numericality: { other_than: 0, message: "can't be blank" }
    validates :municipalities, presence: true
    validates :banchi, presence: true
    validates :number, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }

    validates :token

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Payment.create(order_id: order.id, postcode: postcode, region_id: region_id, municipalities: municipalities, banchi: banchi, building_name: building_name, phone_number: phone_number)
  end
end