var Pin = React.createClass({
  getInitialState: function() {
    return { clicked: false }
  },

  var position = {lat: parseFloat(pin.location.lat), lng: parseFloat(pin.location.lng)};
    var marker = new google.maps.Marker({
      position: position,
      title: pin.name
    });

  render: function(){
    return (<div id='infoWindow'>
        InfoWindow event = {this.state.event}
      </div>
      );
  }
})
