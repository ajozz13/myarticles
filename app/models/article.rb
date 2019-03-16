class Article < ApplicationRecord
  validates_presence_of :title, :body, :author_id
  belongs_to :author, dependent: :destroy
end
