var LogoutButton = React.createClass({
  handleClick: function(e) {
    e.preventDefault();
    request = $.ajax({
      url: "/logout",
      method: "delete"
    });
    request.done(function(responseData){
      this.handleLogin(responseData)
    }.bind(this))

  },

 handleLogin: function(user) {
      this.props.onUserLogin(user)
  },

  render: function() {
    return (
      <button className="btn right" onClick={this.handleClick}>log out</button>
    );
  }
});
