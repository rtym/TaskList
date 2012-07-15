$(document).ready ->
  $("#user_name").autocomplete
    source: "/users/search"
    select: (event, ui) ->
      $('#task_user_id').val(ui.item.id)