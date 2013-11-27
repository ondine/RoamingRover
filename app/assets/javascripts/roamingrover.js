/*Resize dogmap on screen change*/

$(document).ready(function() {
	resizeDogmap();
});

$(window).resize(function() {
	resizeDogmap();
});

function resizeDogmap() {
	$(".dog-map iframe").css("height", ($(window).height() - 80));
	$(".dog-appt").css("height", ($(window).height() - 80));
}

/*Open Proposals*/

$(".dashboard-modbox").click(function() {
	var apptIdFull = $(this).attr("id");
	var apptId = apptIdFull.split("appointment");
	$("#proposal" + apptId[1]).slideToggle();
});

/*Submit proposal and close form*/

$(".dashboard-proposal-submit").click(function() {
	var propIdFull = $(this).parents().parents().parents().parents().attr("id");
	var propId = propIdFull.split("proposal");
	var proposalDescription = $(this).parents().find("textarea[name=proposal_description]").val();
	var proposalRate = $(this).parents().find("input[name=proposal_rate]").val();
	
	if ($(this).parents().find("input[name=proposal_share]").is(":checked")) {
		var proposalPhoneShare = "yes";
	} else {
		var proposalPhoneShare = "no";
	}
	
	//AJAX :) It's beautiful
	
	$.post("dashboard/proposal/", { proposalId: propId[1], proposalDesc: proposalDescription, sharePhone: proposalPhoneShare }, function() {
		$("#proposal-success").slideDown();
		$("#" + propIdFull).slideUp(function() {
			$("#appointment" + propId[1]).fadeOut();
			
			setTimeout(function() {
				$("#proposal-success").slideUp();
			}, 4000);
		});		
	});
});

/*Change active status for signup dogsize*/

$(".signup-dogsize li").click(function() {
	$(".signup-dogsize li").removeClass("active");
	$(this).addClass("active");
});

/*Post user type to rails*/

$(".signup-type-image img").click(function() {
	userType = $(this).attr("data-type");
	$.post("/signup/set/user_type/", { signupType: userType }, function() {
		window.location = "/signup/2/";
	});
});

/*Set dog size hidden field*/

$(".signup-dogsize img").click(function() {
	dogSize = $(this).attr("data-size");
	document.getElementById("dog-size").value = dogSize;
});
