class CreateFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites do |t|
      t.belongs_to :user, null: false
      t.belongs_to :restaurant, null: false
      t.boolean :marked, default: false, null: false
    end

    add_index :favorites, [:user_id, :restaurant_id], unique: true
  end
end
