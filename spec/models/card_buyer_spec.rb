require 'rails_helper'

RSpec.describe CardBuyer, type: :model do
  describe "購入機能の住所保存" do
    before do
      @card_buyer = FactoryBot.build(:card_buyer)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@card_buyer).to be_valid
    end
    it 'buildnameがなくても保存できる' do
      @card_buyer.buildname = nil
      expect(@card_buyer).to be_valid
    end
    it 'zipが空だと保存できないこと' do
      @card_buyer.zip = nil
      @card_buyer.valid?
      expect(@card_buyer.errors.full_messages).to include("Zip can't be blank")
    end
    it 'zipにハイフンがないと保存できないこと' do
      @card_buyer.zip = "1234567"
      @card_buyer.valid?
      expect(@card_buyer.errors.full_messages).to include("Zip is invalid")
    end
    it 'address_idが空だと保存できないこと' do
      @card_buyer.address_id = nil
      @card_buyer.valid?
      expect(@card_buyer.errors.full_messages).to include("Address can't be blank")
    end
    it 'address_idが---だと保存できないこと' do
      @card_buyer.address_id = 1
      @card_buyer.valid?
      expect(@card_buyer.errors.full_messages).to include("Address must be other than 1")
    end
    it 'cityが空だと保存できないこと' do
      @card_buyer.city = nil
      @card_buyer.valid?
      expect(@card_buyer.errors.full_messages).to include("City can't be blank")
    end
    it 'addressが空だと保存できないこと' do
      @card_buyer.address = nil
      @card_buyer.valid?
      expect(@card_buyer.errors.full_messages).to include("Address can't be blank")
    end
    it 'phonecallが空だと保存できないこと' do
      @card_buyer.phonecall = nil
      @card_buyer.valid?
      expect(@card_buyer.errors.full_messages).to include("Phonecall can't be blank", "Phonecall is invalid")
    end
    it 'phonecallにハイフンがあると保存できないこと' do
      @card_buyer.phonecall = "123-4567-8"
      @card_buyer.valid?
      expect(@card_buyer.errors.full_messages).to include("Phonecall is invalid")
    end
    it 'phonecallが12桁以上と保存できないこと' do
      @card_buyer.phonecall = "12345678890123"
      @card_buyer.valid?
      expect(@card_buyer.errors.full_messages).to include("Phonecall is invalid")
    end
  end
end