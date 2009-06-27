class Admin::CommentsController < ApplicationController
  
  before_filter :authenticate
  layout "admin"

  def index
    @comments = Comment.paginate(:page => params[:page], :per_page => 10, :order => 'created_at DESC')
  end
  
  def show
    @comment = Comment.find(params[:id])
  end
  
  def edit
    @comment = Comment.find(params[:id])
  end
  
  def update
    @comment = Comment.find(params[:id])
    
    if @comment.update_attributes(params[:comment])
      flash[:notice] = 'Comment was updated successfully'
      redirect_to admin_comment_url(@comment)
    else
      render :action => :edit
    end
  end
  
  def delete
    @comment = Comment.find(params[:id])
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = 'Comment was deleted successfully'
    redirect_to admin_comments_url
  end
end