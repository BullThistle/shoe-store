class RenameColumns < ActiveRecord::Migration[5.1]
  def change
    rename_column :brands_stores, :brands_id, :brand_id
    rename_column :brands_stores, :stores_id, :store_id
  end
end
