$(document).ready(function(){
  updateVotes()
})

// you're poluting the global namespace, use objects/modules to namespace your method.
var updateVotes = function(){
  $('.button_to').submit(function(e){

    e.preventDefault()
    var $form = $(this)

    $.ajax({
      url: $form.prop('action'),
      type: 'put'
      }).done(function(server_data){
        $('#votes_for_'+server_data.id).html(server_data.votes)
      })
  })
}
