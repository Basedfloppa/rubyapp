class PostsController < ApplicationController
    
    def new
        @posts = Post.new
        @parent = Post.find_by id: params[:parent]
    end

    def create
        @posts = Post.new post_params
        if @posts.save
            flash[:success] = "Post created!"
            redirect_to root_url     
            Log.create(action: "0", post: @posts.id, author: @posts.author)
        else
           render :new  
        end
    end

    def destroy
        @posts = Post.find_by id: params[:id]
        Log.create(action: "2", post: @posts.id, author: current_user.id)
        @posts.destroy
        redirect_to root_url   
    end

    def update
        @posts = Post.find_by id: params[:id]
        if @posts.update post_params
            flash[:success] = "Post updated!"
            Log.create(action: "1", post: @posts.id, author: current_user.id)
            redirect_to root_url             
        else
            render :edit
        end
    end

    def edit
        @posts = Post.find_by id: params[:id]
    end

    def show
        @posts = Post.find_by(id: params[:id])
        @children = Post.where(parent: params[:id]).order(created_at: :desc).page params[:page]
    end

    def upd
        if params[:upvote] == "up"
            Post.find_by(id: params[:id]).upvote(current_user.id)
            redirect_back(fallback_location: root_path)
        end
        if params[:upvote] == "down"
            Post.find_by(id: params[:id]).downvote(current_user.id)
            redirect_back(fallback_location: root_path)
        end
    end

    private

    def post_params
        params.require(:post).permit(:title, :body, :author, :anonimity, :parent, :image)
    end


end