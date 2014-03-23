class CreateArticles < ActiveRecord::Migration
  def change
    create_table :base_articles do |t|
      t.string :title
      t.text :description
      t.text :content

      t.timestamps
    end
  end

  def down
  	 drop_table :base_articles
  end
end
