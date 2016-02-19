var RegisterBox = React.createClass({
  handleRegistrationSubmit: function(form) {
    $.ajax({
      url: "/users",
      dataType: 'json',
      type: 'POST',
      data: form,
      success: function(data) {
        this.setState({data: data})
        ;
      }.bind(this),
      error:function(xhr, status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  },
  render: function() {
    return (
      <div className="registerBox">
        <RegistrationForm />
      </div>
    )
  }
});






var RegistrationForm = React.createClass({
  getInitialState: function() {
    return {author: '', text: ''};
  },
  handleUsernameChange: function(e) {
    this.setState({username: e.target.value});
  },
  handleEmailChange: function(e) {
    this.setState({email: e.target.value});
  },
  handlePasswordChange: function(e) {
    this.setState({password: e.target.value});
  },
  handleSubmit: function(e) {
    e.preventDefault();
    var username = this.state.username.trim();
    var email = this.state.email.trim();
    var password = this.state.email.trim();
    if (!username || !email || !password) {
      return;
    }
    this.props.onRegistrationSubmit({username: username, email: email, password: password});
    this.setState({username: '', email: '', password: ''});
  },
  render: function() {
    return (
      <form className="registrationForm">
        <input
          type="text"
          placeholder="username"
          value={this.state.username}
          onChange={this.handleUsernameChange} />
        <input
          type="text"
          placeholder="email"
          value={this.state.email}
          onChange={this.handleEmailChange} />
        <input
          type="password"
          value={this.state.password}
          onChange={this.handlePasswordChange} />
        <input type="submit" value="Register" />
      </form>
    );
  }
});




ReactDOM.render(
  <RegisterBox />,
  document.getElementById('container')
);
