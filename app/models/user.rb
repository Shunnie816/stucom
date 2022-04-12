class User < ApplicationRecord

    has_secure_password

    validates :name, {presence: true}
    validates :email, {presence: true, uniqueness: true}

    def posts
        return Post.where(user_id: self.id)
    end

    def delete_all_posts
        posts = Post.where(user_id: self.id)
        posts.each do |post|
            post.destroy
        end 
    end

   def delete_liked_posts
       posts = Post.where(user_id: self.id)
       likes = Like.where(post_id: posts.ids)
       likes.each do |like|
            like.destroy
       end
   end

end
