class CreateArticleAuthors < ActiveRecord::Migration
  def change
    create_table :base_article_authors do |t|
      t.integer :base_article_id
      t.integer :author_id
      t.integer :sequence_number

      t.timestamps
    end
  end
end
