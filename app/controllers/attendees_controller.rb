class AttendeesController < ApplicationController

  def index

    render :index

  end

  def create
    @attendee = Attendee.create(:meetingid => session[:activemeetingid], :dept => 'GM')
    @attendee = Attendee.create(:meetingid => session[:activemeetingid], :dept => 'Inbound Ops')
    @attendee = Attendee.create(:meetingid => session[:activemeetingid], :dept => 'Outbound Ops')
    @attendee = Attendee.create(:meetingid => session[:activemeetingid], :dept => 'HR')
    @attendee = Attendee.create(:meetingid => session[:activemeetingid], :dept => 'Finance')
    @attendee = Attendee.create(:meetingid => session[:activemeetingid], :dept => 'PPT')
    @attendee = Attendee.create(:meetingid => session[:activemeetingid], :dept => 'Others')
  end

end
