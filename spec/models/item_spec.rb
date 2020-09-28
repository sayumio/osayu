require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品出品機能' do
    context '商品出品がうまくいくとき' do
      it 'image, name, comment, price, category_id, status_id, charges_id, area_id, days_idが存在すれば出品できる' do
        expect(@item).to be_valid
      end

      it 'priceが半角数字で出品できる' do
        @item.price = '1000'
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Imageを入力してください')
      end

      it 'nameが空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Nameを入力してください')
      end

      it 'commentが空では出品できない' do
        @item.comment = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Commentを入力してください')
      end

      it 'categoryの選択がないと出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include
      end

      it 'statusの選択がないと出品できない' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include
      end

      it 'chargesの選択がないと出品できない' do
        @item.charges_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include
      end

      it 'areaの選択がないと出品できない' do
        @item.area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include
      end

      it 'daysの選択がないと出品できない' do
        @item.days_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include
      end

      it 'priceの入力がないと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Priceを入力してください')
      end

      it 'priceが¥299だと出品できない' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include('Priceは300以上の値にしてください')
      end

      it 'priceが¥10,000,000だと出品できない' do
        @item.price = '10,000,001'
        @item.valid?
        expect(@item.errors.full_messages).to include('Priceは数値で入力してください')
      end

      it 'priceが全角数字と出品できない' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Priceは数値で入力してください')
      end
    end
  end
end
