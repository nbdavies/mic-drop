var NavBar = React.createClass({
  getInitialState: function() {
    return {logged_in: false};
  },

  render: function(){
    var navLoggedOut = <nav className="navigation">
      <div className="brand-logo">mic_drop </div>
      <LoginButton />
      <RegisterButton />
    </nav>

    var navLoggedIn = <nav className="navigation">
      <div className="brand-logo">mic_drop </div>
    </nav>

    var finalNav = (this.state.logged_in ? navLoggedIn : navLoggedOut);
    return(
      finalNav
    );
  }
});

