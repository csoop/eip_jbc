class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
    	t.references :buyer, index: true

      t.timestamps
    end
  end
end
