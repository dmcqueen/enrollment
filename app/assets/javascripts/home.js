$(document).ready(function() {

  $(document).delegate('a.link_remote_delete', 'ajax:success', function() {  
    $(this).closest('tr').fadeOut();  
  });

  $(document).delegate('form', 'ajax:complete', function(evt, data, status, xhr) {  
    $('#content').html(data.responseText);
  });

  $(document).delegate('a.link_remote', 'ajax:success', function(evt, data, status, xhr) {  
    $('#content').html(data);
  });

});
