var RegistrationForm = React.createClass({
  getInitialState: function() {
    return { username: '', password: '', email: ''};
  },

  handleLogin: function(user) {
    this.props.onUserLogin(user)
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
    var password = this.state.password.trim();
    if (!username || !email || !password) {
      return // handle errors;
    }
    var request = $.ajax({
      url: "/users",
      dataType: 'json',
      type: 'POST',
      data: {user: this.state},
    });
    request.done(function(responseData){
      console.log(responseData)
      if (responseData.username === username){
        this.handleLogin(responseData)
        $("#modal1").closeModal();
        $(".lean-overlay").hide()
      }
    }.bind(this));
  },
  render: function() {
    return (
      <div col s12><form className="registrationForm">
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
          placeholder="password"
          value={this.state.password}
          onChange={this.handlePasswordChange} />
        <input type="submit" value="Register" className="btn" onClick={this.handleSubmit} />
      </form></div>

    );
  }
});






