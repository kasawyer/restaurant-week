class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :rating, null: false
      t.string :body, null: false
      t.belongs_to :user, null: false
      t.belongs_to :restaurant, null: false
      t.timestamps
    end
  end
end
