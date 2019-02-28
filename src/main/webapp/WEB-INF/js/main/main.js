$(document).ready(function() {
    $(".nav_lins").click(function(event){
        event.preventDefault();
        $('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);
     });
    $(".topBut").click(function(event){
        event.preventDefault();
        $('html,body').animate({scrollTop:0}, 500);
     });
    
    /*메인으로 아이콘*/
    $(window).scroll(function() {
	  if($(this).scrollTop() >= 400) $(".topBut").show();
	  else $(".topBut").hide();
    });
});