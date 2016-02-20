var NavBar = React.createClass({
  getInitialState: function() {
    return {logged_in: false};
  },

  // handleLoginButtonClick: function() {
  //   this.setState({login_clicked: true});
  //   this.props.onLoginButtonClick({});
  // },

  render: function(){
    return(
    <nav className="navigation">
      <a href="" className="brand-logo">mic_drop</a>
      <LoginButton />
       <RegisterButton />
    </nav>

    );
  }
});

// onLoginButtonClick={this.handleLoginButtonClick}
// onRegisterButtonClick={this.handleRegisterButtonClick}
