class AddCategoryToBuyers < ActiveRecord::Migration
  def change
    add_column :buyers, :category, :string
  end
end
