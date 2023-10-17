class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

   followability

   has_many :posts
  
   has_many :comments  
   has_one_attached :profile_image
   has_many :likes
   has_many :liked_posts, through: :likes, source: :post
   has_many :stories


   def unfollow(user)
    followerable_relationships.where(followable_id: user.id).destroy_all
   end

   def self.user(search)
    if search
       User.find(:all, :conditions => ['email LIKE ?', "%#{search}%"])
     else
       User.find(:all)
     end
   end

end
