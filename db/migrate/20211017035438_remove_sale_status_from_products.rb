class RemoveSaleStatusFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :sale_status, :string
  end
end
