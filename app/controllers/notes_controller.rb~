class NotesController < ApplicationController
	
respond_to :html, :js
	
	def index
		@categories=Templates.where('meetingtype = ?', sessions[:activemeetingtype])
		@notes=Notes.where('meetingid = ?', session[:activemeetingid])
	end
	
  def new
    @note = Note.new
  end
  
  def create
    @note=Notes.create(note_params)
    
    @categories=Templates.where("notecategory='Categories' and meetingtype = ?", session[:activemeetingtype])			
					
		@notes=Notes.where('meetingid = ?', session[:activemeetingid])
  end
  
private
  def note_params
    params.require(:notes).permit(:meetingid, :notetype, :notetag, :details, :assignedto, :duedate)
  end  

end
