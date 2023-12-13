class FirstController < ApplicationController
    
    def index
        @posts = Post.where(parent: 0).order(created_at: :desc).page params[:page]
    end

    def show
        @profile = User.find_by id: params[:id]
    end
end