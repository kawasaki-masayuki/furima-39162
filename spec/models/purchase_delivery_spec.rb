require 'rails_helper'
RSpec.describe PurchaseDelivery, type: :model do
  describe '#create' do
    before do
      @purchase_delivery = FactoryBot.build(:purchase_delivery)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_delivery).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @purchase_delivery.building_name = ''
        expect(@purchase_delivery).to be_valid
      end
    end

    context '内容に問題がある場合' do
      # it "tokenが空では登録できないこと" do
      #   @purchase_delivery.token = nil
      #   @purchase_delivery.valid?
      #   expect(@purchase_delivery.errors.full_messages).to include("Token can't be blank")
      # end
      it 'post_codeが空では登録できないこと' do
        @purchase_delivery.post_code = ""
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと登録できないこと' do
        @purchase_delivery.post_code = '1234567'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'post_codeが全角では登録できないこと' do
        @purchase_delivery.post_code = '１２３－４５６７'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'prefecture_idは1を選択したら保存できないこと' do
        @purchase_delivery.prefecture_id = 1
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'cityが空では登録できないこと' do
        @purchase_delivery.city = ""
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空では登録できないこと' do
        @purchase_delivery.address = ""
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Address can't be blank")
      end
      it 'telephone_numberが空では登録できないこと' do
        @purchase_delivery.telephone_number = ""
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberが半角数値のみでなければ登録できないこと' do
        @purchase_delivery.telephone_number = "０９０１２３４５６７８"
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'telephone_numberが10桁以上(11桁以内)でなければ登録できないこと' do
        @purchase_delivery.telephone_number = "090123456"
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Telephone number is invalid")
      end
      
      it 'userが紐付いていないと保存できないこと' do
        @purchase_delivery.user_id = nil
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @purchase_delivery.item_id = nil
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end