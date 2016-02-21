var NavBar = React.createClass({

  handleUserLogin: function(user) {
      this.props.onUserLogin(user)
  },

  render: function(){

    var loggedOut =
    <nav className="navigation">
      <div className="brand-logo">mic_drop </div>
      <LoginButton loggedIn    = {this.props.loggedIn}
                   onUserLogin = {this.handleUserLogin}
      />
      <RegisterButton loggedIn = {this.props.loggedIn}
                   onUserLogin = {this.handleUserLogin}
      />
    </nav>

    var loggedIn =
      <nav className="navigation">
        <div className="brand-logo">mic_drop </div>
        <ul className="right">
          <li><span className>{this.props.loggedIn.username}</span></li>
          <li><LogoutButton onUserLogin = {this.handleUserLogin} /></li>
          <li><CreateEventButton /></li>
        </ul>
      </nav>

    var buttonZone = (this.props.loggedIn ?  loggedIn : loggedOut)

    return(
      buttonZone
      );
    }
});


