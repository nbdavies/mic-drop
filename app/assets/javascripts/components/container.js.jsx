var Container = React.createClass({
    getInitialState: function() {
    return {
      loggedIn:false
    };
  },

  handleUserInput: function(loggedIn) {
    this.setState({
      loggedIn: loggedIn,
    });
  },

  render: function (){
    return(
      <div className="matroshka">
        <NavBar loggedIn = {this.props.loggedIn}
                onUserInput = {this.handleUserInput}
        />
        <MapDiv loggedIn = {this.props.loggedIn} />
      </div>
    );
  }
});

// yes, future us, matroshka does matter
