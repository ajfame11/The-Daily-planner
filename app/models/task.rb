class Task < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :title, :description, presence: true 
  validates :title, :description, length: { minimum: 2 }

  accepts_nested_attributes_for :category

  scope :by_category, -> (category_slug) { joins(:category).where('categories.slug = ? ', category_slug) }

  

end