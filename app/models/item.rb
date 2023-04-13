class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one :order
  has_one_attached :image

  belongs_to :category
  belongs_to :situation
  belongs_to :delivery_fee_payment
  belongs_to :region
  belongs_to :deadline

  validates :category_id, numericality: { other_than: 1}
  validates :situation_id, numericality: { other_than: 1}
  validates :delivery_fee_payment_id, numericality: { other_than: 1}
  validates :region_id, numericality: { other_than: 1}
  validates :deadline_id, numericality: { other_than: 1}

  validates :image, presence: true
  validates :item_name, presence: true
  validates :item_text, presence: true
  validates :category_id, presence: true
  validates :situation_id, presence: true
  validates :delivery_fee_payment_id, presence: true
  validates :region_id, presence: true
  validates :deadline_id, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
  validates :price, numericality: {only_integer: true, message: 'Half-width number'}

end
