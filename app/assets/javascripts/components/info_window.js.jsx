var InfoWindow = React.createClass({
  render: function(){
    return (<div id="event-details-container">
        <div id="event-details" ref="event-details-window"
        </div>
      </div>);
  },

    var contentString = '<div id="infowindow"><h5>'+pin.name+'</h5><p>'+pin.description+'</p>'+pin.address+'</div>'
    componentDidMount: function() {
      this.event = new google.maps.InfoWindow({
        position: position,
        title: pin.name
      });
    },
  });


