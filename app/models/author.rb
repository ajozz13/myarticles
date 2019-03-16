class Author < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true
  validates :moto, presence: true
  has_many :articles 
end
