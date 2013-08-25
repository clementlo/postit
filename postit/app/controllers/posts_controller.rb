class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update]
  before_action :require_user, only: [:new, :create, :edit, :update]
  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = currrent_user

    if @post.save
      flash[:notice] = "You created a new post"
      redirect_to posts_path
    else
      # handles validations
      render :new
    end
  end

  def edit
    
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "You updated the post!"
      redirect_to post_path(@post)
    else
      render :edit #renders the edit view (not a redirect to edit_post_path)
    end
  end

  private
  
  def post_params
    params.require(:post).permit(:title, :url) #{title:'something', url: 'something'}
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
