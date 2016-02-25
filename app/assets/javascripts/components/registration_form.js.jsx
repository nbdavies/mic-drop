var RegistrationForm = React.createClass({
  getInitialState: function() {
    return { username: '', password: '', email: '', errors:''};
  },

  handleLogin: function(user) {
    this.props.onUserLogin(user);
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
      this.setState({errors: 'Invalid entry, please try again.'});
    }
    var request = $.ajax({
      url: "/users",
      dataType: 'json',
      type: 'POST',
      data: {user: this.state},
    });
    request.done(function(responseData){

      if (responseData.username === username){
        this.handleLogin(responseData)
        $("#modal1").closeModal();
        $(".lean-overlay").hide()
      }
    }.bind(this));
  },
  handleFacebook: function(e) {
    e.preventDefault();
    FB.login(function(response) {
      if (response.authResponse) {
        //user just authorized your app
        $(".as-fuck").text("facebook sync'd").addClass("disabled");
        FB.api("me/friends",
          function(response){
            if (response && !response.error) {
              this.setState({friends: response.data});
            };
          }.bind(this)
        );
        FB.api('/me', function(response) {
          this.setState({facebook_id: response.id})
        }.bind(this));
        FB.api('/me/picture', function(response){
          this.setState({picture_url: response.data.url});
        }.bind(this));
      }
    }.bind(this), {scope: 'public_profile,user_friends', return_scopes: true}
  )},
  render: function() {
    return (
      <div col s12><form className="registrationForm">
        <label>{this.state.errors}</label>
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
        <div className="row"><button className="btn blue as-fuck" onClick={this.handleFacebook}>sync with Facebook</button></div>
        <input type="submit" value="Register" className="btn-flat indigo accent-3" onClick={this.handleSubmit} />
        <Button className="btn-flat indigo accent-3 right" onClick={this.props.handleCancelButtonClick}>Close</Button>
      </form></div>

    );
  }
});
