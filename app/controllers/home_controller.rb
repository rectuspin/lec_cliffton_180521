class HomeController < ApplicationController
  def index
    @posts=Post.all
  end

  def new
    @post=Post.new
  end

  def create
    @post=Post.new
    @post.title=params[:title]
    @post.content=params[:content]
    @post.save
    
    redirect_to "/home/index"
  end

  def edit
    @post=Post.find(params[:post_id])
  end
  
  def update
    @post=Post.find(params[:post_id])
    @post.title=params[:title]
    @post.content=params[:content]
    @post.save
    
    redirect_to "/home/index"
  end
  
  def destroy
    post=Post.find(params[:post_id])
    post.destroy
    
    redirect_to '/home/index'
  end
  
  def view
    @posts = Post.all
    @post = Post.find(params[:post_id])
  end
  
  def commentcreate
    comment = Comment.new
    comment.post_id=params[:post_id]
    comment.content=params[:content]
    comment.save
    
    redirect_to :back
  end
  
  def commentdestroy
    @comment_destroy =Post.find(params[:post_id]).comments.find(params[:comment_id])
    @comment_destroy.destroy
    
    redirect_to :back
  end
  
  def commentedit
    @comment_edit=Post.find(params[:post_id]).comments.find(params[:comment_id])
  end
  
  def commentupdate
    @comment_update=Post.find(params[:post_id]).comments.find(params[:comment_id])
    @comment_update.content=params[:comment_content]
    @comment_update.save
    
    redirect_to "/home/index"
  end  
  
end
