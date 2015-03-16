class TemplatesController < ApplicationController
  
  def create
    temp_meetingtype = params[:meetingtype]
    temp_attendees = params[:attendees].split(",")
    temp_categories = params[:categories].split(',')
	  
	  @template=Templates.create(meetingtype: temp_meetingtype, notecategory: 'Attendees', notedetails: temp_attendees[2].strip)
	  
		unless temp_attendees.nil?
		
			temp_attendees.each { |a| @template=Templates.create(meetingtype: temp_meetingtype, notecategory: 'Attendees', notedetails: a.strip) }
		
		end
		
		unless temp_categories.nil?
		
			temp_categories.each { |c| @template=Templates.create(meetingtype: temp_meetingtype, notecategory: 'Categories', notedetails: c.strip) }
		
		end
		
		flash[:success]=temp_meetingtype + ' template created'
		
  end


end
