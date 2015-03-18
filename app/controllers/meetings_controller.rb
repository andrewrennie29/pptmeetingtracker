class MeetingsController < ApplicationController

respond_to :html, :js
  
  def index
    if session[:activemeetingid].nil?

    else

      @meeting = Meeting.find_by_id(session[:activemeetingid])
			
			@attendees = Attendees.where('meetingid = ?', session[:activemeetingid])
			
			@note=Notes.create(:meetingid => session[:activemeetingid], :notetype => 'test', :notetag => 'test')
			
			session[:viewattendees]=true
			
    end

  end

  def show
    session[:activemeetingid] = nil
    redirect_to '/'
    #render :index
    #@meeting = Meeting.find(params[:id])
  end

  def new
    @meeting = Meeting.new
    @meetingtypes = Templates.select(:meetingtype).distinct.order(:meetingtype)
  end

  def create
    @meetings = Meeting.all
    @meeting = Meeting.create(meeting_params)
    session[:activemeetingid] = @meeting.id
    session[:activemeetingtype] = @meeting.meetingtype
    
    @attendeetemplates = Templates.select(:notedetails).where("notecategory = 'Attendees' and meetingtype = ?", session[:activemeetingtype])
			
			@attendeetemplates.each do |a|
			
				@attendee=Attendees.create(meetingid: session[:activemeetingid], dept: a.notedetails)
			
			end
			
  end

  def edit
    @meeting = Meeting.find(params[:id])
  end

  def update
    @meetings = Meeting.all
    @meeting = Meeting.find(params[:id])
    
    @meeting.update_attributes(meeting_params)
  end

  def delete
    @meeting = Meeting.find(params[:meeting_id])
  end

  def destroy
    @meetings = Meeting.all
    @meeting = Meeting.find(params[:id])
    @meeting.destroy
  end

  def endmeeting
    session[:activemeetingid] = nil
    redirect_to '/'
  end

  def continue
    @fcs=Meeting.select(:fc).distinct
  end
	
	def toggleattendees
		if session[:viewattendees].nil?
			session[:viewattendees]='show'
		else
			session[:viewattendees]=nil
		end
		redirect_to '/'
	end
private
  def meeting_params
    params.require(:meeting).permit(:fc, :meetingtype, :meetingdate, :batchid)
  end

end
