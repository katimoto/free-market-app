class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.string   :zip,              null: false
      t.integer  :address_id,   null: false
      t.string   :city,             null: false
      t.string   :address,          null: false
      t.string   :buildname
      t.string   :phonecall,        null: false
      t.integer  :purchase_id,      null: false, foreign_key: true

      t.timestamps
    end
  end
end
