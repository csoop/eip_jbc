class CreateViewimages < ActiveRecord::Migration
  def change
    create_table :viewimages do |t|
      t.string :image
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end
