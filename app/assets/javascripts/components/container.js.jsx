var Container = React.createClass({
  getInitialState: function() {
    var user = false;
    var request = $.ajax({
      url: "/sessions",
      async: false
    });
    request.done(function(responseData){
      user = responseData;
    });
    return { loggedIn: user };
  },

  handleUserLogin: function(user) {
    this.setState({
      loggedIn: user,
    });
    this.forceUpdate();
  },

  handleEventSubmit: function(eventData) {
    this.onEventSubmit(eventData);
  },

  onEventSubmit: function(eventData) {
    this.refs.googlemap.addEvent();
  },

  render: function (){
    if (this.state.loggedIn) {
      guide = <div>_</div>
    } else {
      guide = <div id='modal5' className='modal siteGuide valign-wrapper'  >
                <SiteGuide class='valign center-align' />
              </div>
    }

    return(
      <div className="matroshka">
        <NavBar loggedIn = {this.state.loggedIn}
                onUserLogin = {this.handleUserLogin}
                onEventSubmit =
                {this.handleEventSubmit}
        />
        <GMap loggedIn = {this.state.loggedIn}
              ref = "googlemap"
        />
        {guide}
      </div>
    );
  }
});

// yes, future us, matroshka does matter
