var MyPlacesButton = React.createClass({
  getInitialState: function() {
    return {clicked: false, buttName: 'My Places'};
  },

  handleFilterAction: function(eventData) {
    this.props.onFilterAction(eventData);
  },


  handleClick: function(e) {
    e.preventDefault();
    if (this.state.clicked === false) {
      this.setState({clicked: true, buttName: 'All Events'});
    } else{
      this.setState({clicked: false, buttName: 'My Places'})
    }
    request = $.ajax({
      url: 'subscriptions'
    });
    request.done(function(responseData){
      handleFilterAction(responseData)
    });
  },

  handleCancelButtonClick: function(e) {
    e.preventDefault();
    $("#modal4").closeModal();
    $(".lean-overlay").hide();
    this.setState({clicked: false})
  },

  render: function() {
    return(
      <Button className='btn right red accent-2' onClick={this.handleClick}>{this.state.buttName}</Button>
    );
  }
});
