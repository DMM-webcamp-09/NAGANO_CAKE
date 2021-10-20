class ChangeColumnNullProducts < ActiveRecord::Migration[5.2]
  def change
    change_column_null :products, :genre_id, false
    change_column_null :products, :name, false
    change_column_null :products, :introduction, false
    change_column_null :products, :price, false
  end
end
