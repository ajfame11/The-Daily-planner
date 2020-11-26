class User < ApplicationRecord
    has_secure_password
    has_many :tasks
    has_many :categories, through: :tasks
    validates :username, uniqueness: true
    validates :username, :password, presence: true 

    def self.find_or_create_by_omniauth(some_hash)
        login_username = some_hash["extra"]["raw_info"]["login"]
        self.where(username: login_username).first_or_create do |user|
            #editing details here
            user.password = SecureRandom.hex
        end 
    end 
end