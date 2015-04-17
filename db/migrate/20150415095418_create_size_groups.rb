class CreateSizeGroups < ActiveRecord::Migration
  def change
    create_table :size_groups do |t|
      t.integer :cart_item_id
      t.string :sizecode
      t.integer :count, :default => 0

      t.timestamps
    end
  end
end
