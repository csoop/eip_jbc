class AddImageToBuyers < ActiveRecord::Migration
  def change
    add_column :buyers, :image, :string
  end
end
