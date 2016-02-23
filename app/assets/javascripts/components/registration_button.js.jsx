var RegisterButton = React.createClass({
  getInitialState: function() {
    return {clicked: false};
  },

  handleClick: function(e) {
    e.preventDefault();
    this.setState({clicked: true});
    $("#modal1").openModal();
  },

  handleCancelButtonClick: function(e) {
    e.preventDefault();
    $("#modal1").closeModal();
    $(".lean-overlay").remove();
    this.setState({clicked: false});
  },

  handleUserLogin: function(user) {
      this.props.onUserLogin(user)
  },

  render: function() {
    var regButton = <button className="btn right red accent-2"  onClick={this.handleClick}>register</button>
    var regFormDiv = <div id='modal1' className='modal registrationForm'><div className="modal-content">
      <RegistrationForm onUserLogin = {this.handleUserLogin}
        handleCancelButtonClick = {this.handleCancelButtonClick}
        /></div></div>
    var button = (this.state.clicked ? regFormDiv : regButton);
    return(
      button
    );
  }
});
