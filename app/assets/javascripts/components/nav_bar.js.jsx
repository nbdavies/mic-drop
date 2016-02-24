var NavBar = React.createClass({

  handleUserLogin: function(user) {
      this.props.onUserLogin(user);
  },

  handleEventSubmit: function(eventData) {
    this.props.onEventSubmit(eventData);
  },

  handleFilterAction: function(eventData) {
    this.props.onFilterAction(eventData);
  },

  maybeRenderAddEvent: function() {
    if (this.props.loggedIn.venues && this.props.loggedIn.venues.length > 0) {
      return <li><CreateEventButton onEventSubmit = {this.handleEventSubmit}/></li>;
    }
  },

  render: function(){

    var loggedOut =
      <ul className="right">
        <LoginButton loggedIn = {this.props.loggedIn}
                  onUserLogin = {this.handleUserLogin}
        />
        <RegisterButton loggedIn = {this.props.loggedIn}
                     onUserLogin = {this.handleUserLogin}
        />
      </ul>

    var addEventButton = <li><CreateEventButton onEventSubmit = {this.handleEventSubmit}/></li>;
    var venues = this.props.loggedIn.venues;

    if (this.props.loggedIn.picture_url){
      var loggedIn =
      <ul className="right">
        <li>
          <img className="responsive-img circle" src={this.props.loggedIn.picture_url} />
        </li>
        <li><LogoutButton onUserLogin = {this.handleUserLogin} /></li>
        { this.maybeRenderAddEvent() }
      </ul>
    } else {
      var loggedIn =
      <ul className="right">
        <li><span className>{this.props.loggedIn.username}</span></li>
        <li><LogoutButton onUserLogin = {this.handleUserLogin} /></li>
        { this.maybeRenderAddEvent() }
      </ul>
    };
    var myPlaces = <ul className="left">
          <li><MyPlacesButton loggedIn = {this.loggedIn} onFilterAction = {this.handleFilterAction}/></li>
        </ul>;

    return(
      <nav className="navigation indigo accent-1">
        <div className="brand-logo center">mic_drop </div>
        {this.props.loggedIn ?  loggedIn : loggedOut}
        {this.props.loggedIn ?  myPlaces : "" }
      </nav>
      );
    }
});
