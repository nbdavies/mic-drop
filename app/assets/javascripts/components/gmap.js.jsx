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
      console.log('FAVES')
        var route = "/events/1"
      } else {
        console.log("NOT FAVES")
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
      console.log("{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{")
      console.log(events)
    });
    events = events.map(function(event){
      event.marker = new google.maps.Marker({
        position: {lat: parseFloat(event.location.lat), lng: parseFloat(event.location.lng)},
        title: event.name,
        map: this.map
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
    var mapOptions = {
      zoom: 15,
      center: new google.maps.LatLng(-34.397, 150.644)
    };
    return new google.maps.Map(this.refs.map_canvas, mapOptions);
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
      return '<img src="'+friend.picture_url+'" title="'+friend.name+'" class="circle">';
    });}
    return friends;
  },

  infoWindow: function(event){
    return '<div class="info-window"><div class="card-image">' +
             '<img src="chad.png">' +
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
