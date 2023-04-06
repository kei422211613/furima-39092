class Item < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true, inclusion: { in: %w(--- メンズ レディース ベビー・キッズ インテリア・住まい・小物 本・音楽・ゲーム おもちゃ・ホビー・グッズ 家電・スマホ・カメラ スポーツ・レジャー ハンドメイド その他) }
  validates :condition, presence: true, inclusion: { in: %w(--- 新品・未使用 未使用に近い 目立った傷や汚れなし やや傷や汚れあり 傷や汚れあり 全体的に状態が悪い) }
  validates :shipping_fee_payer, presence: true, inclusion: { in: %w(--- 着払い(購入者負担) 送料込み(出品者負担) ) }
  validates :prefecture_code, presence: true, inclusion: { in: JpPrefecture::Prefecture.all.map(&:code).unshift('---') }
  validates :shipping_duration, presence: true, inclusion: { in: %w(--- 1~2日で発送 2~3日で発送 4~7日で発送) }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

end
