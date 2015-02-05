class ChangeColorToBuyer < ActiveRecord::Migration
  def change
  	change_column :buyers, :color, :string, :array => true
  end
end
