$(document).ready(function(){
  $('.button_to').submit(function(e){
    
    e.preventDefault()
    var $form = $(this);

    $.ajax({
      url: $form.prop('action'),
      type: 'put'
      }).done(function(server_data){
        console.log(server_data)
        $('#votes_for_'+server_data.id).html(server_data.votes)
      })
  })
})
