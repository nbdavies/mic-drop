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
    return(
      <div className="matroshka">
        <NavBar loggedIn = {this.state.loggedIn}
                onUserLogin = {this.handleUserLogin}
        />
        <GMap />
      </div>
    );
  }
});

// yes, future us, matroshka does matter
