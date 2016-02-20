var LoginButton = React.createClass({
  getInitialState: function() {
    return {clicked: false};
  },
  handleClick: function(e) {
    e.preventDefault();
    this.setState({clicked: true});
    this.props.onLoginButtonClick({});
  },
  render: function() {
    var button = (this.state.clicked ? <div></div> : <button className="btn right red accent-2" onClick={this.handleClick}>login</button>);
    return(
      button
    );
  }
});

var RegisterButton = React.createClass({
  getInitialState: function() {
    return {clicked: false};
  },
  handleClick: function(e) {
    e.preventDefault();
    this.setState({clicked: true});
    this.props.onRegisterButtonClick({});
  },
  render: function() {
    var button = (this.state.clicked ? <div></div> : <button className="btn right red accent-2" onClick={this.handleClick}>register</button>);
    return(
      button
    );
  }
});

var NavBar = React.createClass({
  getInitialState: function() {
    return {logged_in: false};
  },
  handleLoginButtonClick: function() {
    this.setState({login_clicked: true});
    this.props.onLoginButtonClick({});
  },
  handleRegisterButtonClick: function() {
    this.setState({register_clicked: true});
    this.props.onRegisterButtonClick({});
  },
  render: function(){
    return(
    <nav className="navigation">
      <a href="#" className="brand-logo">mic_drop</a>
      <LoginButton onLoginButtonClick={this.handleLoginButtonClick} />
       <RegisterButton onRegisterButtonClick={this.handleRegisterButtonClick} />
    </nav>
    );
  }
});


