class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :genre_id
      t.string :name
      t.string :descript
      t.string :product_image_id
      t.integer :product_price
      t.string :sale_status

      t.timestamps
    end
  end
end
