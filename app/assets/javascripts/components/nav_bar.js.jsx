var NavBar = React.createClass({

  handleUserLogin: function(user) {
      this.props.onUserLogin(user)
  },

  render: function(){
    return(
      <nav className="navigation">
        <div className="brand-logo">mic_drop </div>
        <LoginButton loggedIn    = {this.props.loggedIn}
                     onUserLogin = {this.handleUserLogin}
        />
        <RegisterButton loggedIn = {this.props.loggedIn}
                     onUserLogin = {this.handleUserLogin}
        />
      </nav>
      );
    }
});


