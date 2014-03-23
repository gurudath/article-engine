class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name
      t.text :address
      t.text :description

      t.timestamps
    end
  end
  def down
  	 drop_table  :authors
  	   end
end
