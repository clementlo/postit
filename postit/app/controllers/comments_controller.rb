class CommentsController < ApplicationController
  before_action :require_user

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(params.require(:comment).permit(:body))
    @comment.post = @post # Associate the comment
    @comment.user = current_user
    
    if @comment.save
      flash[:notice] = "Your Comment was created"
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end

  end
end

