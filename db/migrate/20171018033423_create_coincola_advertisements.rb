class CreateCoincolaAdvertisements < ActiveRecord::Migration[5.1]
  def change
    create_table :coincola_advertisements do |t|
      t.string :country_code
      t.string :currency
      t.integer :max_amount
      t.integer :min_amount
      t.string :payment_provider
      t.float :price
      t.integer :advertiser_id

      t.timestamps
    end
  end
end
