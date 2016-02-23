var MyPlacesButton = React.createClass({
  getInitialState: function() {
    return {clicked: false};
  },

  handleClick: function(e) {
    e.preventDefault();
    this.setState({clicked: true});
    $("#modal4").openModal();
  },

  handleCancelButtonClick: function(e) {
    e.preventDefault();
    $("#modal4").closeModal();
    $(".lean-overlay").hide();
    this.setState({clicked: false})
  },

  render: function() {
    var placesButton =  <Button className='btn right red accent-2' onClick={this.handleClick}>My Places</Button>
    var placesListDiv = <div id='modal4' className='modal placesList'><div className="modal-content">
      <MyPlacesList loggedIn = {this.props.loggedIn}
        handleCancelButtonClick = {this.handleCancelButtonClick}
        /></div></div>
    var button = (this.state.clicked ? placesListDiv : placesButton);
    return(
      button
    );
  }
});
