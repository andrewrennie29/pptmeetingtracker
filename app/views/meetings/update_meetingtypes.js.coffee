$("#meetingtypes_select").empty()
  .append("<%= escape_javascript(render partial: 'meetingtypes', locals: { meetingtypes: @meetingtypes }) %>")