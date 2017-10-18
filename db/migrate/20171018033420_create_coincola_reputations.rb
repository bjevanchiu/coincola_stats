class CreateCoincolaReputations < ActiveRecord::Migration[5.1]
  def change
    create_table :coincola_reputations do |t|
      t.integer :feedback_score
      t.integer :trade_count
      t.integer :trusted_count

      t.timestamps
    end
  end
end
