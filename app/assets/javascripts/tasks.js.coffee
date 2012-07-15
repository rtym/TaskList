update_content = () ->
  $('#data_container').load($(location).attr('href') + ' #data_container');

$.timer({ action: update_content, time :3000, autostart : true });

$(document).ready ->
  $("#user_name").autocomplete
    source: "/tasks/search_user"
    select: (event, ui) ->
      $('#task_user_id').val(ui.item.id)