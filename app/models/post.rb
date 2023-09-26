class Post < ApplicationRecord
    
    belong_to :users
    has_many :comments

end
