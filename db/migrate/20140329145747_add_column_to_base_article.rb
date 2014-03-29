class AddColumnToBaseArticle < ActiveRecord::Migration
  def change
    add_column :base_articles, :medium, :string
  end
end
