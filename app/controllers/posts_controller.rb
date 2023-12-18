class PostsController < ApplicationController
  before_action :set_post, only: [:show, :like]

  def index
    @posts = Post.all
  end

  def show

  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path
    else
      flash[:warning] = @post.errors.full_messages
      return :new
    end
  end


  def like
    @post.likes += 1
    @post.save
    redirect_to posts_path
  end



  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:caption, :file)
  end

end
