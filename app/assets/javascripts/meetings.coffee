# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(document).on 'change', '#fc_fc', (evt) ->
    $.ajax 'update_meetingtypes',
      type: 'GET'
      dataType: 'script'
      data: {
        fc_id: $("#fc_fc option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic FC select OK!")
		$.ajax 'update_meetingdates',
      type: 'GET'
      dataType: 'script'
      data: {
        fc_id: $("#fc_fc option:selected").val(),
        meetingtype_id: $("#meetingtypes_select option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic meetingdates select OK!")
        
$ ->
  $(document).on 'change', '#meetingtypes_select', (evt) ->
    $.ajax 'update_meetingdates',
      type: 'GET'
      dataType: 'script'
      data: {
        fc_id: $("#fc_fc option:selected").val(),
        meetingtype_id: $("#meetingtypes_select option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic meetingdates select OK!")
