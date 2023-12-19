class CommentController < ApplicationController


  def comment
    puts "after entering comment function"
    id = params[:post_id]
    @comment = Comment.new(comment_params)
    @comment.post_id =@comment.post_id
    puts "id = #{id}"
    @post = Post.find_by(id: id)
    puts "post = #{@post}"
    puts "comment post = #{@comment.post_id}"
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
    params.require(:comment).permit(:comment, :post_id)
  end


end
