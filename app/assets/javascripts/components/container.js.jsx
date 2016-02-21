var Container = React.createClass({
  getInitialState: function() {
    return { loggedIn: false };
  },

  handleUserLogin: function(loggedIn) {
    this.setState({
      loggedIn: loggedIn,
    });
  },

  render: function (){
    return(
      <div className="matroshka">
        <NavBar loggedIn = {this.state.loggedIn}
                onUserLogin = {this.handleUserLogin}
        />
        <MapDiv loggedIn = {this.state.loggedIn} />
      </div>
    );
  }
});

// yes, future us, matroshka does matter
