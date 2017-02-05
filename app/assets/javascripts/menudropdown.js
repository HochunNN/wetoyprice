$("document").ready(function(){
    var left = $("#menu3").offset().left
  	var top = $("#menu3").offset().top
    $("#menu3div").css("left", left)
  	$("#menu3div").css("top", top + 46)
  	var left = $("#menu4").offset().left
  	var top = $("#menu4").offset().top
  	$("#menu4div").css("top", top + 46)
  	$("#menu4div").css("left", left)
    $("#menu3").hover(function(){
      	var left = $("#menu3").offset().left
      	var top = $("#menu3").offset().top
      	$("#menu3div").css("top", top + 46)
      	$("#menu3div").css("left", left)
      	$("#menu3div").css("opacity", 1)
      	$("#menu3div").css("visibility", "visible")
    })
    $("#menu3").mouseleave(function(){
        $("#menu3div").css("opacity", 0)
    	$("#menu3div").css("visibility", "hidden")
    	$("#menu3div").mouseover(function(){
    	    var left = $("#menu3").offset().left
          	var top = $("#menu3").offset().top
            $("#menu3div").css("left", left)
          	$("#menu3div").css("top", top + 46)
    	    $("#menu3div").css("opacity", 1)
    		$("#menu3div").css("visibility", "visible")
    		$("#menu3div").mouseleave(function(){
    		    $("#menu3div").css("opacity", 0)
    			$("#menu3div").css("visibility", "hidden")
    		})
    	})
    })
    $("#menu4").hover(function(){
      	var left = $("#menu4").offset().left
      	var top = $("#menu4").offset().top
      	$("#menu4div").css("left", left)
      	$("#menu4div").css("top", top + 46)
      	$("#menu4div").css("opacity", 1)
      	$("#menu4div").css("visibility", "visible")
    })
    $("#menu4").mouseleave(function(){
        $("#menu4div").css("opacity", 0)
    	$("#menu4div").css("visibility", "hidden")
    	$("#menu4div").mouseover(function(){
    	    var left = $("#menu4").offset().left
          	var top = $("#menu4").offset().top
          	$("#menu4div").css("top", top + 46)
          	$("#menu4div").css("left", left)
    	    $("#menu4div").css("opacity", 1)
    		$("#menu4div").css("visibility", "visible")
    		$("#menu4div").mouseleave(function(){
    		    $("#menu4div").css("opacity", 0)
    			$("#menu4div").css("visibility", "hidden")
    		})
    	})
    })
})