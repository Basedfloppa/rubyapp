class Post < ApplicationRecord
    validates :title, presence: true, length: {in: 2..50}
    validates :body, presence: true, length: {in: 2..2000}
    validates :author, presence: true

    has_one_attached :image

    def formatted_created_at
        created_at.strftime('%Y-%m-%d %H:%M:%S')
    end

    def upvote(user)
        @rating = Rating.find_by(author: user, post: id)
        if @rating != nil
            if @rating.upvote == false
                @rating.destroy
                Rating.create(author: user, upvote: true, post: id)
            end
        else
            Rating.create(author: user, upvote: true, post: id)
        end
    end

    def downvote(user)
        @rating = Rating.find_by(author: user, post: id)
        if @rating != nil
            if @rating.upvote == true
                @rating.destroy
                Rating.create(author: user, upvote: false, post: id)
            end
        else
            Rating.create(author: user, upvote: false, post: id)
        end
    end

    def rating
        Rating.where("post = #{id} AND upvote = true").count - Rating.where("post = #{id} AND upvote = false").count
    end

end
