class PostsController < ApplicationController
  
  def index
   @post = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end
    
  # def top
  #   @posts = Post.all.order("post.views DESC").page(params[:page]).per(2)
  # end

  def create
     @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end
 
  def show
    @post = Post.find(params[:id])
    @post.update(views: @post.views + 1)
    @comments = @post.comments.order(created_at: :desc)

  end

  def edit
   @post = Post.find(params[:id])
  end

  def update
   @post = Post.find(params[:id])
     if @post.update(params[:post].permit(:title, :text, :avatar, :user_id))
      redirect_to @post
    else
    render 'edit'
    end
  end

  def destroy
   @post = Post.find(params[:id])
   @post.destroy
   
    redirect_to posts_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :text, :avatar, :user_id)
    end
end
