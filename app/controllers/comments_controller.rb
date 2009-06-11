class CommentsController < ApplicationController
  
  
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(params[:comment])
    
    if @comment.save
      flash[:notice] = "Your comment was successfully created."
      redirect_to @post
    else
      @comments = @post.comments
      render :template => 'posts/show'
    end
  end
end
