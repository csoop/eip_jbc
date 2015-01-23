class AddFlagToBuyers < ActiveRecord::Migration
  def change
    add_column :buyers, :flag, :integer, default: '0'
  end
end
