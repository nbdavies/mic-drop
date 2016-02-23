var NavBar = React.createClass({

  handleUserLogin: function(user) {
      this.props.onUserLogin(user);
  },

  handleEventSubmit: function(eventData) {
    this.props.onEventSubmit(eventData);
  },

  handleFilterAction: function(eventData) {
    this.props.onFilterAction(eventData);
  },

  render: function(){

    var loggedOut =
    <nav className="navigation pink accent-2">
      <div className="brand-logo center">mic_drop </div>
      <LoginButton loggedIn    = {this.props.loggedIn}
                   onUserLogin = {this.handleUserLogin}
      />
      <RegisterButton loggedIn = {this.props.loggedIn}
                   onUserLogin = {this.handleUserLogin}
      />

  </nav>;
    var addEventButton = <li><CreateEventButton onEventSubmit = {this.handleEventSubmit}/></li>;
    var venues = this.props.loggedIn.venues;

    var loggedIn =
      <nav className="navigation pink accent-2">
        <div className="brand-logo center">mic_drop </div>
        <ul className="right">
          <li><span className>{this.props.loggedIn.username}</span></li>
          <li><LogoutButton onUserLogin = {this.handleUserLogin} /></li>
          { loggedIn && venues.length > 0 ? addEventButton : null}
        </ul>
        <ul className="left">
          <li><MyPlacesButton loggedIn = {this.props.loggedIn} onFilterAction = {this.props.handleFilterAction}/></li>
        </ul>
      </nav>;



    var buttonZone = (this.props.loggedIn ?  loggedIn : loggedOut);

    return(
      buttonZone
      );
    }
});
