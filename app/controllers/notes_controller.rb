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
    
		@meeting=Meeting.find_by_id(@note.meetingid)
		
    @categories=Templates.where("notecategory='Categories' and meetingtype = ?", session[:activemeetingtype])			
					
		@notes=Notes.where('meetingid = ?', session[:activemeetingid])
		
		@outstanding=Notes.joins("left join meetings on meetings.id = notes.meetingid").where("notes.complete = false and notes.notetag in ('Action','Follow Up') and meetings.fc = ? and notes.meetingid < ?", @meeting.fc, session[:activemeetingid])
		
  end
  
  def complete
  	
  	@note=Notes.find_by_id(params[:id])
  	
  	Notes.update(params[:id], :complete => !@note.complete)
  	
  	@meeting=Meeting.find_by_id(@note.meetingid)
  	
  	@categories=Templates.where("notecategory='Categories' and meetingtype = ?", @meeting.meetingtype)			
					
		@notes=Notes.where('meetingid = ?', @meeting.id)
		
		@outstanding=Notes.joins("left join meetings on meetings.id = notes.meetingid").where("notes.complete = false and notes.notetag in ('Action','Follow Up') and meetings.fc = ? and notes.meetingid < ?", @meeting.fc, session[:activemeetingid])
  
  end
  
private
  def note_params
    params.require(:notes).permit(:meetingid, :notetype, :notetag, :details, :assignedto, :duedate)
  end  

end
