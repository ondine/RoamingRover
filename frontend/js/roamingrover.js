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
