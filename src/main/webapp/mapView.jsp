<%-- 
    Document   : mapView
    Created on : Mar 12, 2016, 9:44:57 PM
    Author     : Tyler Sorenson
--%>

<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%> 
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta name="theme-color" content="#74828f">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/css/toastr.css" rel="stylesheet"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/js/toastr.js"></script>
        <style>
            * {
                border-radius: 0 !important;
            }
            .jumbotron{ 
                background-color: #74828f; /* Orange */
                margin-bottom: 0;
            }  
            #map {
                height: 350px;
            }
            #addLocation {
                background-color: #c25b56;
                border: none;
                padding: 20px;
                color: white;
                width: 100%;
            }
            #search {
                padding: 20px;
                z-index: 2000;
            }
        </style>
        <title>Bathroom Rater</title>
    </head>
    <body>
        <div>
            <div class="jumbotron text-center">
                <h1>Bathroom Rater</h1>
            </div>
            <input id="search" class="form-control" type="text" 
                   placeholder="Search for location">
            <div id="map"></div>
            <button id="addLocation" onclick="addRating();">Add New Location</button>
        </div>
    </body>
    <script type="text/javascript">
        var map;
        var newRating;
        var marker;
        var place;
        toastr.info('Double click to add rating');
function initMap() {
    var mapOptions = {
        center: {lat: -33.8688, lng: 151.2195},
        zoom: 8,
        scrollwheel: true,
        disableDoubleClickZoom: true
      };
  var map = new google.maps.Map(document.getElementById('map'),
    mapOptions);
    
    var initialLocation;
    var siberia = new google.maps.LatLng(60, 105);
    var newyork = new google.maps.LatLng(40.69847032728747, -73.9514422416687);
    var browserSupportFlag =  new Boolean();


    // Try W3C Geolocation (Preferred)
    if(navigator.geolocation) {
      browserSupportFlag = true;
      navigator.geolocation.getCurrentPosition(function(position) {
        initialLocation = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
        map.setCenter(initialLocation);
      }, function() {
        handleNoGeolocation(browserSupportFlag);
      });
    }
    // Browser doesn't support Geolocation
    else {
      browserSupportFlag = false;
      handleNoGeolocation(browserSupportFlag);
    }

    function handleNoGeolocation(errorFlag) {
      if (errorFlag == true) {
        alert("Geolocation service failed.");
        initialLocation = newyork;
      } else {
        alert("Your browser doesn't support geolocation. We've placed you in Siberia.");
        initialLocation = siberia;
      }
      map.setCenter(initialLocation);
    }
    
  var savedLocations = [];
  var bathroomInfo = [];
  var infowindow = new google.maps.InfoWindow();

  <% 
  ArrayList <ArrayList> markers = 
          (ArrayList <ArrayList>) request.getAttribute("markers");
  for(int i = 0;i < markers.size();i++) {
  %>        
          savedLocations[<%=i%>] = new google.maps.Marker({
              position: new google.maps.LatLng(<%= markers.get(i).get(1)%>, <%= markers.get(i).get(2) %>),
              map: map
          });
          savedLocations[<%=i%>].addListener('click', function() {
              infowindow.setContent("<%= markers.get(i).get(0) %>\n" + 
                      "Stars: <%= markers.get(i).get(3) %>");
              infowindow.open(map, savedLocations[<%=i%>]);
              map.panTo(savedLocations[<%=i%>].getPosition());
              map.setZoom(15);
          });
          savedLocations[<%=i%>].setVisible(true);
  <% } %>

  // Create the autocomplete helper, and associate it with
  // an HTML text input box.
  var input = document.getElementById('search');
  var autocomplete = new google.maps.places.Autocomplete(input);

  marker = new google.maps.Marker({
    map: map
  });
  google.maps.event.addListener(marker, 'click', function() {
    infowindow.open(map, marker);
  });
    newRating = new google.maps.Marker({
        map: map 
    });

    google.maps.event.addListener(map, 'dblclick', function(event) {
        marker.setVisible(false);
        newRating.setPosition(event.latLng);
        newRating.setVisible(true);
        infowindow.setContent("Click add location to provide new rating");
        infowindow.open(map, newRating);
        newRating.addListener('click', function() {
              infowindow.setContent("Click add location to provide new rating");
              infowindow.open(map, newRating);
              description.open(map, newRating);
              map.panTo(newRating.getPosition());
              map.setZoom(15);
          });
    });
  // Get the full place details when the user selects a place from the
  // list of suggestions.
  google.maps.event.addListener(autocomplete, 'place_changed', function() {
    infowindow.close();
    place = autocomplete.getPlace();
    if (!place.geometry) {
      return;
    }

    if (place.geometry.viewport) {
      map.fitBounds(place.geometry.viewport);
    } else {
      map.setCenter(place.geometry.location);
      map.setZoom(17);
    }

    // Set the position of the marker using the place ID and location.
    marker.setPlace(/** @type {!google.maps.Place} */ ({
      placeId: place.place_id,
      location: place.geometry.location
    }));
    marker.setVisible(true);
    newRating.setVisible(false);

    infowindow.setContent('<div><strong>' + place.name + '</strong><br>' +
        'Place ID: ' + place.place_id + '<br>' +
        place.formatted_address + '</div>');
    infowindow.open(map, marker);
  });
    // Run the initialize function when the window has finished loading.
    google.maps.event.addDomListener(window, 'load', initMap);
  }
  function addRating() {
      if(marker.getVisible() === false && newRating.getVisible() !== false)
          window.location.href = "addLocation.jsp?Location=" + newRating.getPosition();
      else if(marker.getVisible() !== false && newRating.getVisible() === false)
          window.location.href = "addLocation.jsp?Location=" + place.geometry.location;
      else
          toastr.error('Create a pin to rate location');
          
  }


</script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD-LnG4LpN0hNObA8uWU84Q8wnY_yVCBwU	
    &libraries=places&callback=initMap"></script>
</html>