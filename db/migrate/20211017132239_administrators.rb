class Administrators < ActiveRecord::Migration[5.2]
  def change
    drop_table :administrators
  end
end
