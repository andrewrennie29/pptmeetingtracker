class CommentsController < ApplicationController

	def show
		
		@comment=Comments.new
		@note=Notes.find_by_id(params[:id])
		@comments=Comments.where("noteid = ? ", params[:id])
	
	end
	
	def create
	
		@comment=Comments.create(comment_params)
		
		@note=Notes.find_by_id(@comment.noteid)
		
		@comments=Comments.where("noteid = ?", @comment.noteid)
		
		session[:activeuser] = @comment.enteredby

	end
	
	private
  def comment_params
    params.require(:comments).permit(:meetingid, :noteid, :enteredby, :comment)
  end
	
end
