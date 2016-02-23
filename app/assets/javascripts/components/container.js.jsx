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

  handleEventSubmit: function(eventData) {
    this.onEventSubmit(eventData);
  },

  onEventSubmit: function(eventData) {
    this.refs.googlemap.addEvent();
  },

  render: function (){
    return(
      <div className="matroshka">
        <NavBar loggedIn = {this.state.loggedIn}
                onUserLogin = {this.handleUserLogin}
                onEventSubmit =
                {this.handleEventSubmit}
        />
        <GMap loggedIn = {this.state.loggedIn}
              ref = "googlemap"
        />
      </div>
    );
  }
});

// yes, future us, matroshka does matter
