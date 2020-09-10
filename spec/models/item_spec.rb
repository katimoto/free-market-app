require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/Messi.png')
  end
  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it "商品名、画像、商品の説明、商品のカテゴリー、商品の状態、配送料の負担、発送元の地域、発送までの日数、販売価格があるとき" do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it "商品名が空のとき" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "出品画像が空のとき" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Images can't be blank")
      end
      it "商品の説明が空のとき" do
        @item.text = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it "商品のカテゴリーが空のとき" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "商品の状態が空のとき" do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it "配送料の負担が空のとき" do
        @item.deliv_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Deliv fee can't be blank")
      end
      it "発送元の地域が空のとき" do
        @item.address_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Address can't be blank")
      end
      it "発送までの日数が空のとき" do
        @item.shipment_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment can't be blank")
      end
      it "商品のカテゴリーが---のとき" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "商品の状態が---のとき" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it "配送料の負担が---のとき" do
        @item.deliv_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Deliv fee must be other than 1")
      end
      it "発送元の地域が---のとき" do
        @item.address_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Address must be other than 1")
      end
      it "発送までの日数が---のとき" do
        @item.shipment_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment must be other than 1")
      end
      it "販売価格が空のとき" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "販売価格が300円~9999999円以外のとき" do
        @item.price = 10
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "販売価格が300円~9999999円以外のとき" do
        @item.price = 100000000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 9999999")
      end
    end
  end
end