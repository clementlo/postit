class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(params.require(:comment).permit(:body))
    @comment.post = @post # Associate the comment

    if @comment.save
      flash[:notice] = "Your Comment was created"
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end

  end
end
