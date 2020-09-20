class Category < ApplicationRecord
    has_many :tasks
    has_many :users, through: :tasks
    
    scope :category_filter, ->(val) { where("category_name = ?", val)}

    def self.filter(val) #use syntax
        id_num = Category.category_filter(val)[0].id
        @tasks = Task.task_filter(id_num)
    end

    # def self.filter(val) #use syntax
    #     arr = category.where(category_name: val)[0].id
    #     task.where(category_id: arr)
    # end

end