class CreateRewards < ActiveRecord::Migration[5.0]
  def change
    create_table :rewards do |t|
      t.string :name
      t.integer :price, default: 1
      t.boolean :taken, default: false
      t.references :user, foreign_key: true
    end
  end
end
