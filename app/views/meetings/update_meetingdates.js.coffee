$("#meetingdates_select").empty()
  .append("<%= escape_javascript(render partial: 'meetingdates', locals: { meetingdates: @meetingdates }) %>")