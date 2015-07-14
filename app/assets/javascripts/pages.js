$(function(){
	$(window).scroll(function(){
		if ($(this).scrollTop() > 400){
			$('.navbar-home').addClass('navbar-collored');
		}
		else{
			$('.navbar-home').removeClass('navbar-collored');
		}
	});
});
$( document ).ready(function() {
	$('.navbar-toggle').click(function(){
		$('.navbar-home').toggleClass('navbar-home2','navbar-home'); //Adds 'a', removes 'b' and vice versa
	});
	$("#button-enter").hover(
		function() {
			$( this ).addClass( "animated pulse" );
		}, function() {
			$( this ).removeClass( "animated pulse" );
		}
	);
});