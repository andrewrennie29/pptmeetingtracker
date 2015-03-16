class AttendeesController < ApplicationController

respond_to :html, :js

  def index
		
		@attendees = Attendee.where('meetingid = ?', session[:activemeetingid])
		
		if @attendees.nil?
			@meetingtype=Meeting.select(:meetingtype).where('meetingid = ?', session[:activemeetingid])
			@attendeetemplates = Template.select(:notedetails).where("notecategory = 'Attendees' and meetingtype = ?", @meetingtype)
			
			@attendeetemplates.each do |a|
			
				@attendee=Attendee.create(meetingid: session[:activemeetingid], dept: a.notedetails)
			
			end
			
			@attendees = Attendee.where('meetingid = ?', session[:activemeetingid])
			
		end	
 		
  end

  def create

		@attendees = Attendees.where('meetingid = ?', session[:activemeetingid])
		
		if @attendees.nil?
			@meetingtype=Meetings.select(:meetingtype).where('meetingid = ?', session[:activemeetingid])
			@attendeetemplates = Templates.select(:notedetails).where("notecategory = 'Attendees' and meetingtype = ?", @meetingtype)
			
			@attendeetemplates.each do |a|
			
				@attendee=Attendees.create(meetingid: session[:activemeetingid], dept: a.notedetails)
			
			end
			
			@attendees = Attendees.where('meetingid = ?', session[:activemeetingid])
			
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
    @attendees = Attendee.all
    @attendee = Attendee.find(params[:id])
    
    @attendee.update_attributes(attendee_params)
  end

  def delete
    @attendee = Attendee.find(params[:attendee_id])
  end

  def destroy
    @attendees = Attendee.all
    @attendee = Attendee.find(params[:id])
    @attendee.destroy
  end

  def generateattendees
    @attendee = Attendee.create(:meetingid => session[:activemeetingid], :dept => 'GM')
    @attendee = Attendee.create(:meetingid => session[:activemeetingid], :dept => 'Inbound Ops')
    @attendee = Attendee.create(:meetingid => session[:activemeetingid], :dept => 'Outbound Ops')
    @attendee = Attendee.create(:meetingid => session[:activemeetingid], :dept => 'HR')
    @attendee = Attendee.create(:meetingid => session[:activemeetingid], :dept => 'Finance')
    @attendee = Attendee.create(:meetingid => session[:activemeetingid], :dept => 'PPT')
    @attendee = Attendee.create(:meetingid => session[:activemeetingid], :dept => 'Others')
  
    redirect_to '/'

  end

private
  def attendee_params
    params.require(:attendee).permit(:meetingid, :dept)
  end

end
