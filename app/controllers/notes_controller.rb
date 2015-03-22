class NotesController < ApplicationController
	
	def index
		@categories=Templates.where('meetingtype = ?', sessions[:activemeetingtype])
		@notes=Notes.where('meetingid = ?', session[:activemeetingid])
	end
	
  def new
    @note = Note.new
  end
  
  def create
    @note=Notes.create(note_params)
    render partial: 'notes/index'
  end
  
private
  def note_params
    params.require(:notes).permit(:meetingid, :notetype, :notetag, :details, :assignedto, :duedate)
  end  

end
