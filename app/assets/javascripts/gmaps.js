$(document).ready(function() {
	
	var locations = new Array();
	
	$.get("/getmap/", function(data) {
		//Loop through array and geocode every address with the GOOG
		
		$.each(data, function(k, v) {
			var googleAddress = encodeURIComponent(v[0]);
			
			//Turn off async because you used up all your success callbacks! x_x
			
			$.ajax({
				type: "GET",
				url: "http://maps.googleapis.com/maps/api/geocode/json?sensor=false&address=" + googleAddress,
				async: false,
				success: function(data) {
					var latitude = data['results'][0]['geometry']['location']['lat'];
					var longitude = data['results'][0]['geometry']['location']['lng'];
				
					locations.push([k, v[1], v[2], latitude, longitude]);
				}
			});
		});
	});
	
	function doMap() {
	
	//Need to get and use zipcode to center the map
	
	var dwZipcode = document.getElementById("dw-zip").value;
	
	//One more geocode to get zipcode location
	
	$.get("http://maps.googleapis.com/maps/api/geocode/json?sensor=false&address=" + dwZipcode, function(data) {
		var zip_latitude = data['results'][0]['geometry']['location']['lat'];
		var zip_longitude = data['results'][0]['geometry']['location']['lng'];
		
		//Render map using zipcode coordinates as center
		
		var map = new google.maps.Map(document.getElementById('dw-map'), {
			zoom: 12,
			center: new google.maps.LatLng(zip_latitude, zip_longitude),
			mapTypeId: google.maps.MapTypeId.ROADMAP
		});
		
		var infowindow = new google.maps.InfoWindow();
		
		var marker, i;
		
		//Loop through locations array and place markers on the map
		
		for (i = 0; i < locations.length; i++) {  
			marker = new google.maps.Marker({
				position: new google.maps.LatLng(locations[i][3], locations[i][4]),
				map: map
		});
		
		//Set up click listener on each marker and toggle HTML content when clicked
		
		google.maps.event.addListener(marker, 'click', (function(marker, i) {
			return function() {
				infowindow.setContent("<h3>" + locations[i][1] + "</h3>" + locations[i][2]);
				infowindow.open(map, marker);
				$(".dashboard-modbox").css("background-color", "#FFF");
				$("#appointment" + locations[i][0]).css("background-color", "#dde7ff");
			}
			})(marker, i));
		}
		
		//Clear out all blue color on close of the infowindow
		
		google.maps.event.addListener(infowindow,'closeclick',function(){
			$(".dashboard-modbox").attr("style", "");
		});
	});
	
	} //End function doMap()
	
	//Call it
	
	doMap();
	
	//Change map position when change zip is clicked
	
	$("#change-zip").click(function() {
		doMap();
	});
	
	$("#dw-zip").keypress(function(e) {
        if (e.which == 13) {
			doMap();
		}
    });
});