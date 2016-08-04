$(function(){
	$(document).keydown(function(event){
		console.log(event.keyCode);
		if(event.keyCode==13){
			$("#sendButton").click();
		}
	});
})



