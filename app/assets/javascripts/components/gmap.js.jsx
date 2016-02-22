GMap = React.createClass({
  map: null,
  marker: null,
  infoWindow: null,

  render: function(){
    return (<div id="map-container">
      <div id="map" ref="map_canvas">
      </div>
    </div>);
  },
  componentDidMount: function() {
    // create the map, marker and infoWindow after the component has
    // been rendered because we need to manipulate the DOM for Google =(
    this.map = this.createMap();
    // google.maps.event.addListenerOnce(this.map, 'idle', this.centerMap.bind(this));
    // this.marker = this.createMarker();
    // this.infoWindow = this.createInfoWindow();

    // have to define google maps event listeners here too
    // because we can't add listeners on the map until its created
    // google.maps.event.addListener this.map, 'zoom_changed', => this.handleZoomChange()
    // google.maps.event.addListener this.map, 'dragend', => this.handleDragEnd()
  },
  createMap: function() {
    var mapOptions = {
      minZoom: 9,
      zoom: 10,
      center: new google.maps.LatLng(-34.397, 150.644)
    };

    return new google.maps.Map(this.refs.map_canvas, mapOptions);
  },
  centerMap: function() {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(position) {
        var pos = {
          lat: position.coords.latitude,
          lng: position.coords.longitude
        };

        // infoWindow.setPosition(pos);
        // infoWindow.setContent('YOU');
        debugger;
        this.map.setCenter(pos);
      }, function() {
        handleLocationError(true, infoWindow, map.getCenter());
      });
    } else {
      // Browser doesn't support Geolocation
      handleLocationError(false, infoWindow, map.getCenter());
    }
  }


  // createMarker: ->
  //   marker = new google.maps.Marker
  //     position: new google.maps.LatLng(this.props.coords.lat, @props.coords.lon)
  //     map: @map

  // createInfoWindow: ->
  //   contentString = "<div class='InfoWindow'>I'm a Window that contains Info Yay</div>"
  //   infoWindow = new google.maps.InfoWindow
  //     map: @map
  //     anchor: @marker
  //     content: contentString

  // handleZoomChange: ->
  //   # something happens when the zoom changes
  //   # this is where it's handled

  // handleDragEnd: ->
  //   # something else happens when the map is dragged somewhere
  //   # this is where that's handled

})
