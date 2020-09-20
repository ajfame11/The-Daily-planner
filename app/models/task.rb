class Task < ApplicationRecord
  belongs_to :user
  belongs_to :genre

  validates :title, :description, presence: true 
  validates :title, :description, length: { minimum: 2 }

  scope :task_filter, -> (id_num){ where("category_id = ?", id_num) }

end