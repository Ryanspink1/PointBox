class CreatePoints < ActiveRecord::Migration[5.0]
  def change
    create_table :points do |t|
      t.references :user, foreign_key: true
      t.boolean :point_status, default: true
    end
  end
end
