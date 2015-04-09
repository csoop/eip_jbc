class AddFlagToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :flag, :integer, :default => "0"
  end
end
