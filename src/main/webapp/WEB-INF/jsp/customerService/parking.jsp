<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>停車資訊</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyChKsAbFPVA7QU-k5fM13sUIZk_gHRRwjE&libraries=geometry,places,marker,core,maps,routes,drawing"></script>
    <link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	rel="stylesheet">
    <style>
      body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        text-align: center;
    }
    
    #map-container {
        position: relative;
        margin: 20px auto;
        width: 80%;
        height: 800px;
    }
    
    #map {
        width: 100%;
        height: 100%;
    }
    
    h1 {
        margin: 20px;
        text-align: center;
        font-size: 2em; 
        font-weight: bold; 
        margin-top: 1em;
    }
    
    button {
        font-size: 1.2em;
        color: #fff;
        background-color: #2196F3;
        border: none;
        padding: 10px 20px;
        border-radius: 4px;
        cursor: pointer;
        transition: all 0.3s ease-in-out;
    }
    
    button:hover {
        background-color: #0c7cd5;
    }
    
    #distance {
        position: absolute;
        top: 15px;
        right: 60px;
        font-size: 1.5em;
        color: #333;
        background-color: #f2f2f2;
        border: 1px solid #ccc;
        border-radius: 4px;
        padding: 20px;
        box-shadow: 0px 2px 6px rgba(0, 0, 0, 0.3);
        z-index:9999;
    }
    </style>
    
   
</head>
<body onload="initMap()">
<jsp:include page="../layout/header.jsp"></jsp:include>
<main id="main">

<h1><i class="fa-solid fa-map-location-dot"></i> 鄰近停車資訊</h1>
<div id="map-container">
            <div id="distance" style="display:none;"></div>
            <div id="map"></div>
        </div>
 </main>   
    <jsp:include page="../layout/footer.jsp"></jsp:include>
    
    
     <script>
  
     var currentInfoWindow;
     var directionsService = new google.maps.DirectionsService();
     var directionsDisplay = new google.maps.DirectionsRenderer();
     var distanceDiv = document.getElementById('distance');
     function initMap() {
        var location = { lat: 22.9967625 , lng: 120.2168564 };
        var map = new google.maps.Map(document.getElementById("map"), {
            zoom: 15,
            center: location
        });
        directionsDisplay.setMap(map); // 讓路線顯示在地圖上
        
     // 添加主要位置的标记
        var mainMarker = new google.maps.Marker({
            position: location,
            map: map,
            icon: {
                url: "https://maps.google.com/mapfiles/ms/micons/blue-dot.png",
                scaledSize: new google.maps.Size(30, 30),
            }
        });
        var request = {
            location: location,
            radius: '1000',
            query: 'parking'
        };
        var service = new google.maps.places.PlacesService(map);
        service.textSearch(request, function(results, status) {
            if (status === google.maps.places.PlacesServiceStatus.OK) {
                for (var i = 0; i < results.length; i++) {
                    var place = results[i];
                    console.log(place.name);
                    console.log(place.formatted_address);
                    var icon = {
                        url: "https://maps.google.com/mapfiles/kml/shapes/parking_lot_maps.png",
                        scaledSize: new google.maps.Size(30, 30),
                    };
                    var marker = new google.maps.Marker({
                        position: place.geometry.location,
                        map: map,
                        icon: icon,
                    });
                    var infoWindow = new google.maps.InfoWindow({
                        content: '<div><strong>' + place.name + '</strong><br>' + place.formatted_address +
                            '<br><button onclick="calculateDistance(' + place.geometry.location.lat() + ',' + place.geometry.location.lng() + ')">最短距離</button></div>'
                    });
                    google.maps.event.addListener(marker, 'click', (function(marker, infoWindow) {
                        return function() {
                            if (currentInfoWindow) {
                                currentInfoWindow.close();
                            }
                            infoWindow.open(map, marker);
                            distanceDiv.style.display = 'block';
                            currentInfoWindow = infoWindow;
                        }
                    })(marker, infoWindow));
                }
            }
        });
     }
     
     function calculateDistance(lat, lng) {
        var destination = new google.maps.LatLng(lat, lng);
        var origin = new google.maps.LatLng(22.9967625, 120.2168564); // 目標位置的經緯度
        var request = {
            origin: origin,
            destination: destination,
            travelMode: 'DRIVING'
        };
        directionsService.route(request, function(response, status) {
            if (status == 'OK') {
                directionsDisplay.setDirections(response);
                var distance = response.routes[0].legs[0].distance.text;
                showDistance(distance);
            }
        });
     }
     function showDistance(distance) {
    	    document.getElementById('distance').innerHTML = '路線距離: ' + distance;
    	}
    
</script>

    
 
       
</body>
</html>