var MyPlacesButton = React.createClass({
  getInitialState: function() {
    return {clicked: false, buttName: 'My Places'};
  },

  handleClick: function(e) {
    e.preventDefault();
    if (this.state.clicked === false) {
      this.setState({clicked: true, buttName: 'All Events'});
    } else{
      this.setState({clicked: false, buttName: 'My Places'})
    }
  },

  handleCancelButtonClick: function(e) {
    e.preventDefault();
    $("#modal4").closeModal();
    $(".lean-overlay").hide();
    this.setState({clicked: false})
  },

  render: function() {
    var placesButton =  <Button className='btn right red accent-2' onClick={this.handleClick}>{this.state.buttName}</Button>
    return(
      placesButton
    );
  }
});
