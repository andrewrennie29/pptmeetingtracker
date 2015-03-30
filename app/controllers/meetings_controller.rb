class MeetingsController < ApplicationController

respond_to :html, :js
  
  def index
    if session[:activemeetingid].nil?

    else

      @meeting = Meeting.find_by_id(session[:activemeetingid])
			
			@attendees = Attendees.where('meetingid = ?', session[:activemeetingid])
			
			@note=Notes.new
			
			@categories=Templates.where("notecategory='Categories' and meetingtype = ?", session[:activemeetingtype])			
					
			@notes=Notes.where('meetingid = ?', session[:activemeetingid])
			
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
    @meeting = Meeting.where("fc = ? and meetingtype = ? and meetingdate = ?", params[:meeting]["fc"], params[:meeting]["meetingtype"], params[:meeting]["meetingdate"])
    
    if @meeting.count>0
    	
    	session[:activemeetingid] = @meeting.first.id
    	session[:activemeetingtype] = @meeting.first.meetingtype
    
    else
    
		  @meeting = Meeting.create(meeting_params)
		  session[:activemeetingid] = @meeting.id
		  session[:activemeetingtype] = @meeting.meetingtype
		  
		  @attendeetemplates = Templates.select(:notedetails).where("notecategory = 'Attendees' and meetingtype = ?", session[:activemeetingtype])
			
				@attendeetemplates.each do |a|
			
					@attendee=Attendees.create(meetingid: session[:activemeetingid], dept: a.notedetails)
			
				end
		
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
    @fcs=Meeting.where("fc is not null and fc <> ''").group("fc")
    @meetingtypes=Meeting.group("meetingtype ASC")
    @meetingdates=Meeting.group("batchid DESC")
  end
	
	def review
	
		@meeting = Meeting.find_by_id(params[:meetingid])
			
		@attendees = Attendees.where('meetingid = ?', params[:meetingid])
			
		@categories=Templates.where("notecategory='Categories' and meetingtype = ?", @meeting.meetingtype)			
					
		@notes=Notes.where('meetingid = ?', params[:meetingid])
	
	end
	
	def update_meetingtypes
    @meetingtypes = Meeting.where("fc = ?", params[:fc_id]).group("meetingtype")
    respond_to do |format|
      format.js
    end
  end

	def update_meetingdates
    @meetingdates = Meeting.where("fc = ? and meetingtype = ?", params[:fc_id], params[:meetingtype_id]).group("batchid")
    respond_to do |format|
      format.js
    end
  end
	
	def setrecallid
	
		@meeting=Meeting.where("fc = ? and meetingtype = ? and meetingdate = ?", params[:fc]["fc"], params[:meetingtype]["meetingtype"], params[:meetingdate]["meetingdate"])
		session[:activemeetingid] = @meeting.first.id
		session[:activemeetingtype] = @meeting.first.meetingtype
    redirect_to '/'
		
	end
	
private
  def meeting_params
    params.require(:meeting).permit(:fc, :meetingtype, :meetingdate, :batchid)
  end

end
