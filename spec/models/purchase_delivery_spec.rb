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
      it "tokenが空では登録できないこと" do
        @purchase_delivery.token = nil
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("トークンを入力してください")
      end
      it 'post_codeが空では登録できないこと' do
        @purchase_delivery.post_code = ""
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと登録できないこと' do
        @purchase_delivery.post_code = '1234567'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include('郵便番号は無効です。 ハイフン(-)を含めてください')
      end
      it 'post_codeが全角では登録できないこと' do
        @purchase_delivery.post_code = '１２３－４５６７'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include('郵便番号は無効です。 ハイフン(-)を含めてください')
      end
      it 'prefecture_idは1を選択したら保存できないこと' do
        @purchase_delivery.prefecture_id = 1
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("都道府県は1以外の値にしてください")
      end
      it 'cityが空では登録できないこと' do
        @purchase_delivery.city = ""
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("市町村を入力してください")
      end
      it 'addressが空では登録できないこと' do
        @purchase_delivery.address = ""
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("番地を入力してください")
      end
      it 'telephone_numberが空では登録できないこと' do
        @purchase_delivery.telephone_number = ""
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'telephone_numberが半角数値のみでなければ登録できないこと' do
        @purchase_delivery.telephone_number = "０９０１２３４５６７８"
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("電話番号は無効です")
      end
      it 'telephone_numberが10桁以上(11桁以内)でなければ登録できないこと' do
        @purchase_delivery.telephone_number = "090123456"
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("電話番号は無効です")
      end
      it 'telephone_numberが12桁以上では登録できないこと' do
        @purchase_delivery.telephone_number = "090123456789"
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("電話番号は無効です")
      end
      it 'userが紐付いていないと保存できないこと' do
        @purchase_delivery.user_id = nil
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Userを入力してください")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @purchase_delivery.item_id = nil
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Itemを入力してください")
      end
    end
  end
end