class Post < ApplicationRecord
    
    belongs_to :user
    has_many :comments
    has_one_attached :post_image

    has_many :likes
    has_many :liking_users, through: :likes, source: :user

end
