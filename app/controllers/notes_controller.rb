class NotesController < ApplicationController
	
	def index
		@categories=Templates.where('meetingtype = ?', sessions[:activemeetingtype])
		@notes=Notes.where('meetingid = ?', session[:actvivemeetingid])
	end
	
  def new
    @note = Note.new
  end
  
  def create
    note=Note.new
  end

end
