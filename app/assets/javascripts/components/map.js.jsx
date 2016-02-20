var MapDiv = React.createClass({
  render: function () {
    if (this.props.login_clicked) {
      return (<LoginForm />)
    }
    else if (this.props.register_clicked) {
      return (<RegistrationForm />)
    }
    else {
      return (<div id="map"></div>);
    };
  }
});
