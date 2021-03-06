class MeetingRecallController < ApplicationController

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

end
