function initMap() {
  var pins;
  var request = $.ajax({
    url: '/events'
  });
  request.done(function(responseData){
    pins = responseData;

    var map = new google.maps.Map(document.getElementById("map"), {
    center: {lat: -34.397, lng: 150.644},
    zoom: 16
    });
    var infoWindow = new google.maps.InfoWindow({map: map});
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(position) {
        var pos = {
          lat: position.coords.latitude,
          lng: position.coords.longitude
        };

        infoWindow.setPosition(pos);
        infoWindow.setContent('YOU');
        map.setCenter(pos);
      }, function() {
        handleLocationError(true, infoWindow, map.getCenter());
      });
    } else {
      // Browser doesn't support Geolocation
      handleLocationError(false, infoWindow, map.getCenter());
    }

    pins.forEach(function(pin){
      var position = {lat: parseFloat(pin.location.lat), lng: parseFloat(pin.location.lng)};
      var marker = new google.maps.Marker({
        position: position,
        title: pin.name
      });

      // var contentString = '<div id="infowindow"><h5>'+pin.name+'</h5><p>'+pin.description+'</p>'+pin.address+'</div>'


      // var infoWindow = new google.maps.InfoWindow({
      //   content: contentString
      // });

      marker.setMap(map);
      marker.addListener('click', function() {
        infoWindow.open(map,marker);
      });
    });

  });
}

function handleLocationError(browserHasGeolocation, infoWindow, pos) {
  infoWindow.setPosition(pos);
  infoWindow.setContent(browserHasGeolocation ?
                        'Error: The Geolocation service failed.' :
                        'Error: Your browser doesn\'t support geolocation.');
}
