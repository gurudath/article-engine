class BaseArticleAuthor < ActiveRecord::Base
 belongs_to :base_article
 belongs_to :author
end
