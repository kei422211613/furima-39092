class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image

  
  belongs_to :category
  belongs_to :situation
  belongs_to :delivery_fee_payment
  belongs_to :region
  belongs_to :deadline

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :situation_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_fee_payment_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :region_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :deadline_id, numericality: { other_than: 1 , message: "can't be blank"}


  validates :user_id, presence: true
  validates :image, presence: true
  validates :item_name, presence: true
  validates :item_text, presence: true
  validates :category, presence: true
  validates :situation, presence: true
  validates :delivery_fee_payment, presence: true
  validates :region, presence: true
  validates :deadline, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }


  def was_attached?
    self.image.attached?
  end

end
