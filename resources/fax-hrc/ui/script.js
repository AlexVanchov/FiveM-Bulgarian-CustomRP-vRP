var audio = new Audio('action.ogg');
$(function(){
	window.onload = function(e){
		window.addEventListener('message', function(event){

			var item = event.data;
			/* ----HELP SECTION---- */
			if (item !== undefined && item.type === "help") {

				if (item.display === true) {
					$('#help').delay(100).fadeIn( 0 );
					audio.play();
				} else if (item.display === false) {
					$('#help').fadeOut( "slow" );
				}
			}
			/* ----RULES SECTION---- */
			if (item !== undefined && item.type === "rules") {

				if (item.display === true) {
					$('#rules').delay(100).fadeIn( 0 );
					audio.play();
				} else if (item.display === false) {
					$('#rules').fadeOut( "slow" );
				}
			}
			/* ----COMMANDS SECTION---- */
			if (item !== undefined && item.type === "cmds") {

				if (item.display === true) {
					$('#cmds').delay(100).fadeIn( 0 );
					audio.play();
				} else if (item.display === false) {
					$('#cmds').fadeOut( "slow" );
				}
			}
		});
	};
});