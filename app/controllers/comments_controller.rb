class CommentsController < ApplicationController
  def create
    binding.pry
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment].permit(:body, :commenter, :post_id))
    redirect_to post_path(@post)
  end
 
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

 private
    def comment_params
      params.require(:comment).permit(:body, :commenter, :post_id)
    end
end
