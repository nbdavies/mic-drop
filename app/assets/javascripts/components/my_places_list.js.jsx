var MyPlacesList = React.createClass({
  render: function() {
    var request = $.ajax({
      url: "/subscriptions",
      data: {user_id: this.props.loggedIn.id}
    });

    return ( <div></div>
    );
  }
});
