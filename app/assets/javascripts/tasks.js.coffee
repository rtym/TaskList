update_content = () ->
  $('#data_container').load($(location).attr('href') + ' #data_container');

$.timer({ action: update_content, time :3000, autostart : true });

$(document).ready ->
  $("#tags").autocomplete
    source: "search_user"