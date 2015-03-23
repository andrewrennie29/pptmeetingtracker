class AttendeesController < ApplicationController

respond_to :html, :js

  def index
		
		@attendees = Attendees.where('meetingid = ?', session[:activemeetingid])
		
		if @attendees.count==0
			@attendeetemplates = Templates.select(:notedetails).where("notecategory = 'Attendees' and meetingtype = ?", session[:activemeetingtype])
			
			@attendeetemplates.each do |a|
			
				@attendee=Attendees.create(meetingid: session[:activemeetingid], dept: a.notedetails)
			
			end
			
			@attendees = Attendees.where('meetingid = ?', session[:activemeetingid])
			
		end
 		
  end

  def create

		@attendees = Attendees.where('meetingid = ?', session[:activemeetingid])
		
		if @attendees.count==0
			@attendeetemplates = Templates.select(:notedetails).where("notecategory = 'Attendees' and meetingtype = ?", session[:activemeetingtype])
			
			@attendeetemplates.each do |a|
			
				@attendee=Attendees.create(meetingid: session[:activemeetingid], dept: a.notedetails)
			
			end
			
			@attendees = Attendees.where('meetingid = ?', session[:activemeetingid])
			
			render 'attendees/attendees'
			
		end

  end

  def show
		
		@attendees = Attendees.where('meetingid = ?', session[:activemeetingid])
		
		if @attendees.nil?
			@meetingtype=Meeting.select(:meetingtype).where('meetingid = ?', session[:activemeetingid])
			@attendeetemplates = Template.select(:notedetails).where("notecategory = 'Attendees' and meetingtype = ?", @meetingtype)
			
			@attendeetemplates.each do |a|
			
				@attendee=Attendee.create(meetingid: session[:activemeetingid], dept: a.notedetails)
			
			end
			
			@attendees = Attendee.where('meetingid = ?', session[:activemeetingid])
			
		end	
  end

  def new
    @attendee = Attendee.new
  end

  def edit
    @attendee = Attendee.find(params[:id])
  end

  def update
    
    params[:attendees].each do |a|
    
    	@attendee=Attendees.find_by_id(a.id)
    
    end
    
  end

  def delete
    @attendee = Attendee.find(params[:attendee_id])
  end

  def destroy
    @attendees = Attendee.all
    @attendee = Attendee.find(params[:id])
    @attendee.destroy
  end

private
  def attendee_params
    params.require(:attendee).permit(:meetingid, :dept)
  end

end
