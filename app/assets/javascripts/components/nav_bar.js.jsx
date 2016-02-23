var NavBar = React.createClass({

  handleUserLogin: function(user) {
      this.props.onUserLogin(user);
  },

  handleEventSubmit: function(eventData) {
    this.props.onEventSubmit(eventData);
  },

  render: function(){

    var loggedOut =
    <nav className="navigation pink accent-2">
      <div className="brand-logo">mic_drop </div>
      <LoginButton loggedIn    = {this.props.loggedIn}
                   onUserLogin = {this.handleUserLogin}
      />
      <RegisterButton loggedIn = {this.props.loggedIn}
                   onUserLogin = {this.handleUserLogin}
      />
  </nav>;

    var loggedIn =
      <nav className="navigation pink accent-2">
        <div className="brand-logo">mic_drop </div>
        <ul className="right">
          <li><span className>{this.props.loggedIn.username}</span></li>
          <li><LogoutButton onUserLogin = {this.handleUserLogin} /></li>
          <li><CreateEventButton onEventSubmit = {this.handleEventSubmit}/></li>
        </ul>
      </nav>;

    var buttonZone = (this.props.loggedIn ?  loggedIn : loggedOut);

    return(
      buttonZone
      );
    }
});
