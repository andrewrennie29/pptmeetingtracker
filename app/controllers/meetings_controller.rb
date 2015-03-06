class MeetingsController < ApplicationController

respond_to :html, :js
  
  def index
    if session[:activemeetingid].nil?

    else

      @meeting = Meeting.find_by_id(session[:activemeetingid])

    end

  end

  def show
    @meeting = Meeting.find(params[:id])
  end

  def new
    @meeting = Meeting.new
  end

  def create
    @meetings = Meeting.all
    @meeting = Meeting.create(meeting_params)
    session[:activemeetingid] = @meeting.id
    @attendees = Attendees.create
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

private
  def meeting_params
    params.require(:meeting).permit(:fc, :meetingtype, :meetingdate, :batchid)
  end

end
