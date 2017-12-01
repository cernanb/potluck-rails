class CommentsController < ApplicationController

  def create
    event = Event.find(params[:event_id])
    comment = current_user.comments.build(comment_params)
    comment.event = event

    if comment.save
      redirect_to event
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :event_id)
    end
end
