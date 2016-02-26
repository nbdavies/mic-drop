var NavBar = React.createClass({

  getInitialState: function() {
    return {loggedIn: this.props.loggedIn};
  },

  componentWillReceiveProps: function(nextProps){
    this.setState({loggedIn: nextProps.loggedIn});
  },

  handleUserLogin: function(user) {
    this.setState({loggedIn: user});
    this.forceUpdate();
    this.props.onUserLogin(user);
  },

  handleEventSubmit: function(eventData) {
    this.props.onEventSubmit(eventData);
  },

  handleFilterAction: function() {
    this.props.onFilterAction();
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
    </ul>;

    var addEventButton = <li><CreateEventButton onEventSubmit = {this.handleEventSubmit}/></li>;
    var venues = this.state.loggedIn.venues;

    if (this.state.loggedIn.picture_url){
      var loggedIn =
      <ul className="right">
        <li>
          <img className="responsive-img circle" src={this.state.loggedIn.picture_url} />
        </li>
        <li><LogoutButton onUserLogin = {this.handleUserLogin} /></li>
        { this.maybeRenderAddEvent() }
      </ul>
    } else {
      var loggedIn =
      <ul className="right">
        <li><span className>{this.state.loggedIn.username}</span></li>
        <li><LogoutButton onUserLogin = {this.handleUserLogin} /></li>
        { this.maybeRenderAddEvent() }
      </ul>
    };
    var myPlaces = <ul className="left">
          <li><MyPlacesButton loggedIn = {this.state.loggedIn} onFilterAction = {this.handleFilterAction}/></li>
        </ul>;

    return(
      <nav className="navigation indigo accent-3">
        <div className="brand-logo center"><img src='MicDropLogo.png'/> </div>
        {this.state.loggedIn ?  loggedIn : loggedOut}
        {this.state.loggedIn ?  myPlaces : "" }
      </nav>
      );
    }
});
