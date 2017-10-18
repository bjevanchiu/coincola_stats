class CreateCoincolaAdvertisers < ActiveRecord::Migration[5.1]
  def change
    create_table :coincola_advertisers do |t|
      t.string :name
      t.string :avatar
      t.integer :reputation_id
      t.string :state

      t.timestamps
    end
  end
end
