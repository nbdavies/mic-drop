var MapDiv = React.createClass({
  getDefaultState: function () {
    return {
      initialZoom: 8,
      mapCenterLat: 43.6425569,
      mapCenterLng: -79.4073126,
    };
  },

  componentDidMount: function () {
  var mapOptions = {
      center: {lat: "43", lng: "39"},
      zoom: this.props.initialZoom
    };

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
  },
  render: function () {
    // var pins;
    // var request = $.ajax({
    //   url: '/events'
    // });
    // request.done(function(responseData){
    //   pins = responseData;
    // };
    return (
      <div className='map' />
        // {pins.forEach(function(pin){

        // })};

    );
  }
});
