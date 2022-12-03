class CreatePrices < ActiveRecord::Migration[7.0]
  def change
    create_table :prices do |t|
      t.timestamp :time, index: true
      t.integer :value, index: true

      t.timestamps
    end
  end
end
