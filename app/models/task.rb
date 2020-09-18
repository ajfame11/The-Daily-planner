class Task < ApplicationRecord
  belongs_to :user
  belongs_to :category
  accepts_nested_attributes_for :category

  validates :title, :description, presence: true 
  validates :title, :description, length: { minimum: 2 }
  validates :category, presence: true
end
