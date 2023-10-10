module PostsHelper

    def post_liked_by_user? post_id
        Like.where(posts_id: post_id, users_id: current_user.id).any?
    end

end
