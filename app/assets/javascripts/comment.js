var Comment = {

	init: function(){
		$('form#new_comment').on('ajax:success', this.appendComment);
		$('form#new_comment').on('ajax:error', this.appendErrors);
	},

	appendComment: function(event, data, status, xhr){
		$('ul#comment_list').append(data.insightful_comment);
	},

	appendErrors: function(event, xhr, status, error){
		$('ul#comment_list').before($.parseJSON(xhr.responseText).error)
	}

}

$(document).ready(function(){
	Comment.init();
})