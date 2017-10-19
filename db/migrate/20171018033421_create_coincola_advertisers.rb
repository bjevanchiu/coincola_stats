class CreateCoincolaAdvertisers < ActiveRecord::Migration[5.1]
  def change
    create_table :coincola_advertisers do |t|
      t.string :name
      t.string :avatar
      t.string :state
      t.integer :feedback_score
      t.integer :trade_count
      t.integer :trusted_count

      t.timestamps
    end
  end
end
