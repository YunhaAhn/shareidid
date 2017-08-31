class Post < ActiveRecord::Base
    resourcify
     belongs_to :category
    has_many :comments
    belongs_to :user
    
    def self.search(search) 
         if search 
           where('content LIKE ?', "%#{search}%") || where('title LIKE ?', "%#{search}%") 
         else 
           all 
         end 
    end
    self.per_page = 5
    
    
end
