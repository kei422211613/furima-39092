require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @item_order = FactoryBot.build(:item_order, user_id: user.id, item_id: item.id)
  end

  describe '配送先情報の保存' do
    context '配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@item_order).to be_valid
      end
      it 'user_idが空でなければ保存できる' do
        @item_order.user_id = 1
        expect(@item_order).to be_valid
      end
      it 'item_idが空でなければ保存できる' do
        @item_order.item_id = 1
        expect(@item_order).to be_valid
      end
      it '郵便番号は、3桁ハイフン4桁の半角文字列の組み合わせであれば保存できる' do
        @item_order.post_code = '123-4560'
        expect(@item_order).to be_valid
      end
      it '都道府県が「---」以外かつ空でなければ保存できる' do
        @item_order.region_id = 2
        expect(@item_order).to be_valid
      end
      it '市区町村が空でなければ保存できる' do
        @item_order.municipalities = '横浜市'
        expect(@item_order).to be_valid
      end
      it '番地が空でなければ保存できる' do
        @item_order.banchi = '旭区１２３'
        expect(@item_order).to be_valid
      end
      it '建物名が空でも保存できる' do
        @item_order.building_name = nil
        expect(@item_order).to be_valid
      end
      it '電話番号が11番桁以内かつハイフンなしであれば保存できる' do
        @item_order.number = 12_345_678_910
        expect(@item_order).to be_valid
      end
    end

    context '配送先情報の保存ができないとき' do
      it 'user_idが空だと保存できない' do
        @item_order.user_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @item_order.item_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空だと保存できないこと' do
        @item_order.post_code = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号にハイフンがないと保存できないこと' do
        @item_order.post_code = 1_234_567
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it '都道府県が空だと保存できないこと' do
        @item_order.region_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Region can't be blank")
      end
      it '都道府県が「---」だと保存できないこと' do
        @item_order.region_id = 0
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Region can't be blank")
      end
      it '市区町村が空だと保存できないこと' do
        @item_order.municipalities = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Municipalities can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @item_order.banchi = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Banchi can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @item_order.number = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Number is invalid")
      end
      it '電話番号にハイフンがあると保存できないこと' do
        @item_order.number = '123 - 1234 - 1234'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Number is invalid')
      end
      it '電話番号が9桁以下では保存できない' do
        @item_order.number = 12_345_678_9
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Number is invalid')
      end
      it '電話番号が12桁以上あると保存できないこと' do
        @item_order.number = 12_345_678_910_123_111
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Number is invalid')
      end
      it 'トークンが空だと保存できないこと' do
        @item_order.token = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end