class CreateBrandsStores < ActiveRecord::Migration[5.1]
  def change
    create_table :brands_stores do |t|
      t.column :brands_id, :integer
      t.column :stores_id, :integer

      t.timestamps
    end
  end
end
