var Container = React.createClass({
  getInitialState: function() {

    var user = false;
    var request = $.ajax({
      url: "/sessions",
      async: false
    });
    request.done(function(responseData){
      user = responseData;
    });
    return { loggedIn: user };
  },

  handleUserLogin: function(user) {
    this.setState({
      loggedIn: user,
    });
  },

  render: function (){
    var map;

    function initMap(){
      map = new google.maps.Map(this.getDOMNode(), mapOptions);
    }

    return(
      <div className="matroshka">
        <NavBar loggedIn = {this.state.loggedIn}
                onUserLogin = {this.handleUserLogin}
        />
        <MapDiv loggedIn = {this.state.loggedIn}
                map ={map}
        />
      </div>
    );
  }
});

// yes, future us, matroshka does matter
