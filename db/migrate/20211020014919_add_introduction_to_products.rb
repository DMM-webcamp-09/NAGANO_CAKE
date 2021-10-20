class AddIntroductionToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :introduction, :text
  end
end
