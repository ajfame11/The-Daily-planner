class Category < ApplicationRecord
    has_many :tasks
    has_many :users, through: :tasks

    after_create :generate_slug

    validates :name, presence: true

    def generate_slug
        update(slug: name.parameterize) # changes "Category Example Name" => "category-example-name" and save on the slug column in the categories table
    end
    
end