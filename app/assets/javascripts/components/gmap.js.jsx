var GMap = React.createClass({
  map: null,
  marker: null,
  infoWindow: null,

  getInitialState: function() {
    var events;

    var request = $.ajax({
      url: "/events",
      async: false
    });
    request.done(function(responseData){
      events = responseData;
    });
    var markers=[];
    var pins = events.map(function(event){
      var marker = new google.maps.Marker({
        position: {lat: parseFloat(event.location.lat), lng: parseFloat(event.location.lng)},
        map: this.map,
        title: event.name
      });
      markers.push(marker);
      return (<Pin event={event} key={event.id}/>);
    }.bind(this));
    return {
      events: events,
      markers: markers,
      pins: pins
    }
  },

  componentDidMount: function(){
    this.map = this.createMap();
    this.state.markers.forEach(function(marker){
      marker.setMap(this.map);
    }.bind(this));

    var infoWindow = new google.maps.InfoWindow({map: this.map});
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(position) {
        var pos = {
          lat: position.coords.latitude,
          lng: position.coords.longitude
        };

        infoWindow.setPosition(pos);
        infoWindow.setContent('YOU');
        this.map.setCenter(pos);
      }.bind(this), function() {
        handleLocationError(true, infoWindow, map.getCenter());
      });
    } else {
      handleLocationError(false, infoWindow, map.getCenter());
    };
        // var contentString = '<div id="infowindow"><h5>'+event.name+'</h5><p>'+event.description+'</p>'+event.address+'</div>'

        //   console.log(contentString);

        // var infoWindow = new google.maps.InfoWindow({
        //   content: contentString
        // });


        // marker.addListener('click', function() {
        //   infoWindow.open(this.map,marker);
      //   });
      // });
    // });
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
      zoom: 16,
      center: new google.maps.LatLng(-34.397, 150.644)
    };
    return new google.maps.Map(this.refs.map_canvas, mapOptions);
  },

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

  render: function(){

    return(<div id="map-container" >
      <div id="map" ref="map_canvas">
        { this.state.pins.map(function(pin){ return pin })}
      </div>
    </div>
    );
  }
});

