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
  
  def complete
  	
  	@note=Notes.find_by_id(params[:id])
  	
  	Notes.update(params[:id], :complete => !@note.complete)
  	
  	@meeting=Meeting.find_by_id(@note.meetingid)
  	
  	@categories=Templates.where("notecategory='Categories' and meetingtype = ?", @meeting.meetingtype)			
					
		@notes=Notes.where('meetingid = ?', @meeting.id)
  
  end
  
private
  def note_params
    params.require(:notes).permit(:meetingid, :notetype, :notetag, :details, :assignedto, :duedate)
  end  

end
