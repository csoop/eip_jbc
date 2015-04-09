class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.integer :buyer_id
      t.integer :cart_id
      t.string  :color

      t.timestamps
    end
  end
end
