
$(document).ready(function(){

 window.addEventListener( 'message', function( event ) {
        var item = event.data;

        if ( item.showPlayerMenu == true ) {
	$('body').css('background-color','transparent');

$('.container-fluid').css('display','block');
} else if ( item.showPlayerMenu == false ) { // Hide the menu

$('.container-fluid').css('display','none');
$('body').css('background-color','transparent important!');
	$("body").css("background-image","none");

        }
    } );

    $("#desempregado").click(function(){
        $.post('http://vrp_ilegal/desempregado', JSON.stringify({}));2

    });
	
	$("#ladraocarro").click(function(){
        $.post('http://vrp_ilegal/ladraocarro', JSON.stringify({}));2

    });
	
	$("#traficatortuga").click(function(){
        $.post('http://vrp_ilegal/traficatortuga', JSON.stringify({}));2

    });
	
	$("#traficadrogas").click(function(){
        $.post('http://vrp_ilegal/traficadrogas', JSON.stringify({}));2

    });
	
	$("#hacker").click(function(){
        $.post('http://vrp_ilegal/hacker', JSON.stringify({}));2

    });

    $("#closebtn").click(function(){
        $.post('http://vrp_ilegal/closeButton', JSON.stringify({}));2

    });

})
