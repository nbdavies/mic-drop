var NavBar = React.createClass({
  handleChange: function(){
    this.props.onUserInput(
      );
  },
  render: function(){
  return(
    <nav className="navigation">
      <div className="brand-logo">mic_drop </div>
      <LoginButton loggedIn = {this.props.loggedIn} />
      <RegisterButton loggedIn = {this.props.loggedIn} />
    </nav>
    );
  }
});


