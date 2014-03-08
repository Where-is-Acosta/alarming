$(document).ready ->
  $("#new_alarm").on("ajax:success", (e, data, status, xhr) ->
    $("#new_alarm").append xhr.responseText
  ).bind "ajax:error", (e, xhr, status, error) ->
    $("#new_alarm").append "<p>ERROR</p>"