require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品出品できるとき' do
      it '全ての項目が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品できないとき' do
      it 'imageが空では登録できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it 'product_nameが空では登録できないこと' do
        @item.product_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it 'explanationが空では登録できないこと' do
        @item.explanation = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'category_idは1を選択したら保存できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーは1以外の値にしてください")
      end
      it 'commodity_condition_idは1を選択したら保存できないこと' do
        @item.commodity_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態は1以外の値にしてください")
      end
      it 'shipping_charge_idは1を選択したら保存できないこと' do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("送料の負担は1以外の値にしてください")
      end
      it 'prefecture_idは1を選択したら保存できないこと' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送元/都道府県は1以外の値にしてください")
      end
      it 'delivery_date_idは1を選択したら保存できないこと' do
        @item.delivery_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送までの日数は1以外の値にしてください")
      end
      it 'priceが空では登録できないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください")
      end
      it 'priceが全角数字だと保存できないこと' do
        @item.price = '２０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は数値で入力してください")
      end
      it '価格が300未満では登録できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は300以上の値にしてください')
      end
      it '価格が9999999を超えると登録できないこと' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は9999999以下の値にしてください')
      end
      it 'ユーザーが紐づいていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end