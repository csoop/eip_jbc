class CreateBuyers < ActiveRecord::Migration
  def change
    create_table :buyers do |t|
      t.string :ppname
      t.string :styleid
      t.string :color
      t.string :fabric
      t.string :user_id

      t.timestamps
    end
  end
end
