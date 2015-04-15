class AddPriceToBuyers < ActiveRecord::Migration
  def change
    add_column :buyers, :price, :integer
  end
end
