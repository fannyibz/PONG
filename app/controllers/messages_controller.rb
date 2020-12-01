class MessagesController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @message = Message.new(message_params)
    @message.event = @event
    @message.user = current_user
    authorize @message

    if @message.save
      ChatroomChannel.broadcast_to(
        @event,
        message: render_to_string(partial: "message", locals: { message: @message, is_author: false }),
        author_id: current_user.id
      )

      # redirect_to chatroom_event_path(@event, anchor: "message-#{@message.id}") --> comportement directement initié dans notre function JS chatroom
    else
      render "events/chatroom"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end

