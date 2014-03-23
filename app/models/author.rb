class Author < ActiveRecord::Base
	has_many :base_article_authors
has_many :articles , :through=>:base_article_authors
end
