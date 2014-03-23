class BaseArticle < ActiveRecord::Base
has_many :base_article_authors
has_many :authors , :through=>:base_article_authors


# searchable do
#   integer :id
#   text :title, :stored => true
#   text :content, :stored => true
#   text :description
#   integer :author_ids, :multiple => true
# end


def article_id
  BaseArticle.all.collect(&:id) if !BaseArticle.all.blank?
end

def article_authors
 Author.all.collect(&:id)  if !BaseArticle.all.blank?
end


 def self.article_search(query,page=1,per_page=10)
 @results= results = BaseArticle.search do
    fulltext query do
      boost_fields :title => 3.0
      highlight :content
    end
    facet(:author_ids)
    paginate :page => page, :per_page => per_page
  end 
  return @results
 end

# after_create do |article|
#   article.index!
# end

# after_update do |article|
#   article.index!
# end
end
