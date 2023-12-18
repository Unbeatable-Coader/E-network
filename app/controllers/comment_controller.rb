class CommentController < ApplicationController


  def comment
    puts "after entering comment function"
    @post = Post.find_by(id: params[:post_id])
    puts "post = #{@post}"
    @comment = Comment.new(comment_params)
    @comment.post_id = @post
    @comment.user = current_user
    if @comment.save
      redirect_to posts_path
    else
      redirect_to posts_path
      puts "error = #{@comment.errors.full_messages}"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end


end
