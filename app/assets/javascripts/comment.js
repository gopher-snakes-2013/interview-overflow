var Comment = {

	init: function(){
		$('form#new_comment').on('ajax:success', this.appendComment);
	},

	appendComment: function(event, data, status, xhr){
		$('ul#comment_list').append(data.insightful_comment);
	}
}

$(document).ready(function(){
	Comment.init();
})