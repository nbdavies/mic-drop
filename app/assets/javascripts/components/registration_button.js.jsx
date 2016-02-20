var RegisterButton = React.createClass({
  getInitialState: function() {
    return {clicked: false};
  },
  handleClick: function(e) {
    e.preventDefault();
    this.setState({clicked: true});
    $("#modal1").openModal();
    },

  render: function() {
    var regButton = <button className="btn right red accent-2"  onClick={this.handleClick}>register</button>
    var regFormDiv = <div id='modal1' className='modal registrationForm'><div className="modal-content"><RegistrationForm /></div></div>
    var button = (this.state.clicked ? regFormDiv : regButton);
    return(
      button
    );
  }
});
