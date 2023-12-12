class PostsController < ApplicationController
  before_action :set_post, only: [:show, :like, :comment]

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
    puts " this is file = #{@post.file}"
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

  def comment
    comment = @post.comments.build(comment_params)
    comment.user = current_user

    if comment.save
      redirect_to posts_path
    else
      redirect_to posts_path, alert: "Comment could not be saved."
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:caption, :file)
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
