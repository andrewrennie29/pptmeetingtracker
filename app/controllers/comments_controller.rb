class CommentsController < ApplicationController

	def show
		
		@comment=Comments.new
		@note=Notes.find_by_id(params[:id])
		@comments=Comments.where("noteid = ? ", params[:id])
	
	end
	
	def create
	
		@comment=Comments.create(comment_params)
		session[:activeuser] = @comment.enteredby

	end
	
	private
  def comment_params
    params.require(:comments).permit(:meetingid, :noteid, :enteredby, :comment)
  end
	
end
