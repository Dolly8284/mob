class PostsController < ApplicationController
  
  def index
     # @post = current_user.posts.order("RANDOM()").first(5)
     @post = Post.all
  end

  def new
    @post = Post.new
  end
    
  # def like
  #   @popular = Like.popular.where(liked: true)
  # end

  def latetscomment
    @latetscomment = Comment.order(id: :desc).limit(10)
  end

  def create
     @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end
 
  def show
    # binding.pry
    @post = Post.find(params[:id])
    @post.update(views: @post.views + 1)
    @comments = @post.comments.order(created_at: :desc)

  end

  def edit
   @post = Post.find(params[:id])
  end

  def update
   @post = Post.find(params[:id])
     if @post.update(params[:post].permit(:title, :body, :avatar, :user_id))
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
      # binding.pry
      params.require(:post).permit(:title, :body, :avatar, :user_id)
    end
end
