require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
  end

  describe '配送先情報の保存' do
    context '配送先が保存できる場合' do
      it 'すべての項目が入力されていれば保存できる' do
        expect(@purchase_address).to be_valid
      end

      it '建物名が空欄でも保存できる' do
        @purchase_address.building_name = nil
        expect(@purchase_address).to be_valid
      end
    end

    context '配送先が保存できない場合' do
      it '郵便番号が空欄では保存できない' do
        @purchase_address.post_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end

      it '郵便番号にハイフンがなければ保存できない' do
        @purchase_address.post_code = '1231234'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end

      it '都道府県の情報が未選択では保存できない' do
        @purchase_address.sender_area_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Sender area can't be blank")
      end

      it '市区町村が空欄では保存できない' do
        @purchase_address.municipalities = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Municipalities can't be blank")
      end

      it '番地が空欄では保存できない' do
        @purchase_address.street_address = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Street address can't be blank")
      end

      it '電話番号が空欄では保存できない' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号にハイフンがあると保存できない' do
        @purchase_address.phone_number = '090-0000-0000'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号が12桁以上では保存できない' do
        @purchase_address.phone_number = '090000000000'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end

      it "tokenが空では登録できないこと" do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end

    end
  end
end