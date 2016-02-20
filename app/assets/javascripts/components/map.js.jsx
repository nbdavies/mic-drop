var Map = React.createClass({
  render: function () {
    if (this.props.login_clicked) {
      return (<LoginForm />)
    } else {
      return (<p> This is a placeholder for the map. </p>)
    };
  }
});
