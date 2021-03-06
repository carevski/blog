class PostsController < ApplicationController
  
  before_filter :set_spam_timestamp
  
  def index
    conditions = {:page => params[:page], :per_page => 5, :order => 'created_at DESC', :include => :tags, :conditions => 'published_at IS NOT NULL'}
    
    if !params[:tag].blank? && (tag = Tag.find_by_name(params[:tag]))
      @posts = tag.posts.paginate(conditions)
      @title = "#{params[:tag].capitalize}"
      @keywords = params[:tag]
    else
      @posts = Post.paginate(conditions)
      @title = "Home"
      @keywords = BLOG_KEYWORDS
    end
    
    respond_to do |format|
      format.html
      format.rss { render :layout => false}
    end
  end

  def show
    @post = Post.find params[:id], :conditions => 'published_at IS NOT NULL'
    @comments = @post.comments.find(:all, :conditions => {:approved => true})
    @comment = Comment.new
  end
  
  private

  def set_spam_timestamp
    session[:spam_timestamp] = Time.now.to_i
  end
end