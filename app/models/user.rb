class User < ApplicationRecord

    has_secure_password
    has_many :tasks
    has_many :categories, through: :tasks

    validates :username, uniqueness: true, presence: true
end
