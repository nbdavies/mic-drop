var Container = React.createClass({


  handleUserLogin: function(loggedIn) {
    this.setProps({
      loggedIn: loggedIn,
    });
  },

  render: function (){
    return(
      <div className="matroshka">
        <NavBar loggedIn = {this.props.loggedIn}
                onUserLogin = {this.handleUserLogin}
        />
        <MapDiv loggedIn = {this.props.loggedIn} />
      </div>
    );
  }
});

// yes, future us, matroshka does matter
