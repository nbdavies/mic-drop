var GMap = React.createClass({

  getInitialState: function() {
    return this.getEventData();
  },

  addEvent: function() {
    this.setState(this.getEventData());
  },

  componentDidUpdate(prevProps) {
    console.log("prevprops fave is")
    console.log(prevProps.favs)
    console.log("current props fav is")
    console.log(this.props.favs)
    if (prevProps.favs !== this.props.favs) {
    this.setState(this.getEventData());
    }
    this.componentDidMount()
  },

  getEventData: function() {
    if (this.props.favs) {
        var route = "/events/1"
      } else {
        var route = "/events"
      }
      console.log(route)
    var events;
    var request = $.ajax({
      url: route,
      async: false
    });
    request.done(function(responseData){
      events = responseData;
    });
    events = events.map(function(event){
      event.marker = new google.maps.Marker({
        position: {lat: parseFloat(event.location.lat), lng: parseFloat(event.location.lng)},
        title: event.name,
        map: this.map,
        icon: "/mic-2.png"
      });
      return event;
    }.bind(this));
    return { events: events };
  },

  componentDidMount: function(){
    this.map = this.createMap();
    this.state.events.forEach(function(event){
      event.marker.setMap(this.map);
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
  },

  createMap: function() {
    var styles = [
      {
        "featureType": "transit.line",
        "stylers": [
          { "visibility": "off" }
        ]
      },
      {
        "featureType": "poi",
        "stylers": [
          { "visibility": "off" }
        ]
      },
      {
        "featureType": "administrative",
        "stylers": [
          { "visibility": "off" }
        ]
      },
      {
        "featureType": "landscape",
        "stylers": [
          { "visibility": "off" }
        ]
      },
      {
        "featureType": "poi.park",
        "stylers": [
          { "visibility": "on" }
        ]
      },
      //Desaturate option
      // {
      //   "stylers": [
      //     { "saturation": -42 },
      //     { "lightness": 16 },
      //     { "gamma": 0.79 }
      //   ]
      // }
      //Grayscale option
      // {
      //   "stylers": [
      //     { "saturation": -100 },
      //     { "lightness": -9 },
      //     { "gamma": 0.71 }
      //   ]
      // }
      //Monochrome option
      // {
      //   "stylers": [
      //     { "hue": "#ff8800" }
      //   ]
      // }
      //Reverse monochrome
  //       {
  //   "stylers": [
  //       { "invert_lightness": true },
  //       { "saturation": 28 },
  //       { "gamma": 1.57 },
  //       { "lightness": -13 }
  //     ]
  // }
    // invert lightness
      // {
      //   "stylers": [
      //     { "invert_lightness": true },
      //     { "gamma": 1.57 },
      //     { "lightness": -13 },
      //     { "saturation": -35 }
      //   ]
      // }
    ];
    var styledMap = new google.maps.StyledMapType(styles, {name: "Styled Map"});
    var mapOptions = {
      zoom: 15,
      center: new google.maps.LatLng(-34.397, 150.644),
      disableDefaultUI: true,
      mapTypeControlOptions: {
        mapTypeIds: [google.maps.MapTypeId.ROADMAP, 'map_style']
      }
    };
    var map = new google.maps.Map(this.refs.map_canvas, mapOptions);
    map.mapTypes.set('map_style', styledMap);
    map.setMapTypeId('map_style');
    return map;
  },

  venueFavForm: function(event){
    if (event.fav) {
      var favButt = '<form action="/subscriptions/'+event.venue_name+'" method="post" id="unfav">'+
        '<input type="hidden" name="_method" value="delete">'+
        '<input type="hidden" name="subscriptions[venue_name]" value="'+event.venue_name+'">'+
        '<input type="hidden" name="subscriptions[user_id]" value="'+event.user_id+'">'+
        '<input type="submit" value="Remove from My Places" class="btn yellow"></form>';
    } else if (this.props.loggedIn) {
      var favButt = '<form action="/subscriptions" method="post" id="fav">'+
        '<input type="hidden" name="subscriptions[venue_name]" value="'+event.venue_name+'">'+
        '<input type="submit" value="Add to My Places" class="btn grey"></form>';
    } else { var favButt = "" };
    return favButt;
  },

  eventRsvpForm: function(event){
    if (event.rsvp) {
      var rsvp_form = '<form action="/rsvps/'+event.id+'" method="post" id="unrsvp">'+
      '<input type="hidden" name="_method" value="delete">'+
      '<input type="hidden" name="rsvp[event_id]" value='+event.id+'>'+
      '<input type="submit" value="Flake Out" class="btn red"></form>'
    } else if (this.props.loggedIn) {
      var rsvp_form = '<form action="/rsvps" method="post" id="rsvp">'+
      '<input type="hidden" name="rsvp[event_id]" value='+event.id+'>'+
      '<input type="submit" value="RSVP" class="btn green"></form>'
    } else { var rsvp_form = "" };
    return rsvp_form;
  },

  eventTags: function(event){
    var tags = "";
    if (event.tags) {tags = event.tags.map(function(tag){
      return '<div class="chip">'+tag.name+'</div>';
    });}
    return tags.join('');
  },

  friendsAttending: function(event){
    var friends = "";
    if (event.friends_going.length > 0) {
      friends = '<h6>Your friends going:</h6><br>'+event.friends_going.map(function(friend){
      return '<img src="'+friend.picture_url+'" title="'+friend.name+'" class="circle friend">';
    });}
    return friends;
  },

  infoWindow: function(event){
    return '<div class="info-window"><div class="card-image">' +
             '<img src="'+event.photo+'">' +
             '<span class="card-title"><h5>'+event.name+'</h5></span>' +
           '</div>' +
           '<div class="card-content">' +
             'Today from '+event.start_time+' to '+event.end_time+'<br><span id="attendees">'+event.attendees+'</span> people going<br>'+
             this.friendsAttending(event)+
             '<p><h6>Description</h6>'+event.description+'</p><h6>'+event.venue_name+'</h6><p>'+
             event.address+'</p>' +
           '</div>'+
           '<div class="card-action">'+
             this.eventTags(event)+this.eventRsvpForm(event)+this.venueFavForm(event)+
           '</div></div>';
  },

  render: function(){
    this.state.events.forEach(function(event){
      var infowindow = new google.maps.InfoWindow({
        content: this.infoWindow(event)
      });
      google.maps.event.clearInstanceListeners(event.marker);
      event.marker.addListener('click', function() {
        infowindow.open(this.map, event.marker);
      });
    }.bind(this));

    return(<div id="map-container" >
      <div id="map" ref="map_canvas">
        { this.state.events.map(function(event){ return <Pin event={event} loggedIn={this.props.loggedIn} key={event.id} /> }.bind(this))}
      </div>
    </div>
    );
  }
});
