var LoginButton = React.createClass({
  getInitialState: function() {
    return {clicked: false};
  },

  handleClick: function(e) {
    e.preventDefault();
    this.setState({clicked: true});
    $("#modal2").openModal();
  },

  handleCancelButtonClick: function(e) {
    e.preventDefault();
    $("#modal2").closeModal();
    $(".lean-overlay").remove();
    this.setState({clicked: false});
  },

  handleUserLogin: function(user) {
      this.props.onUserLogin(user)
  },

  render: function() {
    var logButton = <button className="btn-flat indigo accent-3"  onClick={this.handleClick}>login</button>
    var logFormDiv = <div id='modal2' className='modal loginForm'><div className="modal-content">
    <LoginForm  onUserLogin = {this.handleUserLogin}
                handleCancelButtonClick = {this.handleCancelButtonClick}
                /></div></div>
    var button = (this.state.clicked ? logFormDiv : logButton);
    return(
      button
    );
  }
});
