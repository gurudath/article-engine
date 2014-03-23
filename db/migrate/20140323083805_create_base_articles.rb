class CreateBaseArticles < ActiveRecord::Migration
  def change
    create_table :base_articles do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
