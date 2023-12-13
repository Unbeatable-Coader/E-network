class ProfileController < ApplicationController



  def new
    @user_detail = UserDetail.new
  end

  def create
    puts "before user detail"
    @user_detail = UserDetail.new(user_detail_params)
    @user_detail.user = current_user
    puts "user detail = #{@user_detail}"
      if @user_detail.save
        puts "before saving"
        redirect_to posts_path
      else
        puts "Validation errors: #{@user_detail.errors.full_messages}"
        flash[:alert] = @user_detail.errors.full_messages
        return
      end
  end


  def user_profile
    @user_detail = UserDetail.find_by(user_id: params[:user_id])
    @user = User.find_by(id: params[:user_id])
    puts "user name = #{@user.posts}"
  end

  def edit

  end

  def profile_pic
    @pic = params[:profile_pic]
    @profile_pic = UserDetail.update(profile_pic: @pic)
  end


  private

  def user_detail_params
    params.require(:user_detail).permit(:name, :userName, :DOB, :email, :gender, :mobile)
  end

end
