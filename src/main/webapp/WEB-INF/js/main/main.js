$(document).ready(function() {
    $(".nav_lins").click(function(event){
        event.preventDefault();
        $('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);
     });
    $(".topBut").click(function(event){
        event.preventDefault();
        $('html,body').animate({scrollTop:0}, 500);
     });
    $(".topBut").hide();
    
    /*메인으로 아이콘*/
    $(window).scroll(function() {
    	var scrollBottom = $("body").height()-800;
    	if($(this).scrollTop() >= 400){
    		$(".topBut").show();
    		if($(this).scrollTop() >= scrollBottom){
    			$(".topBut").hide();
    		}
    	}
	  	else $(".topBut").hide();
    });
});