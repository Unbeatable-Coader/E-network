class MessagesController < ApplicationController
  def create
    @current_user = current_user
    @message = @current_user.messages.create(content: msg_params[:content], room_id: params[:room_id])

    if @message.save
      turbo_stream.append(:messages, partial: 'messages/message', locals: { message: @message })
    end
  end


  private

  def msg_params
    params.require(:message).permit(:content)
  end
end
