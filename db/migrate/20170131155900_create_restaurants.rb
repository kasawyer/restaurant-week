class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.string :name, null: false
      t.string :image_url, null: false
      t.string :region, null: false
      t.string :address, null: false
      t.string :cuisine
      t.string :lunch_price
      t.string :lunch_menu_link
      t.string :dinner_price
      t.string :dinner_menu_link
      t.string :special_notes
    end
  end
end
