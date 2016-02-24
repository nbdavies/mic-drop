var CreateEventButton = React.createClass({
  getInitialState: function() {
    return {clicked: false};
  },

  handleClick: function(e) {
    e.preventDefault();
    this.setState({clicked: true});
    $("#modal3").openModal();
  },

  handleCancelButtonClick: function(e) {
    e.preventDefault();
    $("#modal3").closeModal();
    $(".lean-overlay").remove();
    this.setState({clicked: false});
  },

  handleEventSubmit: function(eventData) {
    this.props.onEventSubmit(eventData);
  },

  render: function() {
    var createEventButton = <button className="btn-flat indigo accent-3 right" onClick={this.handleClick}>create event</button>;
    var createEventFormDiv = <div id='modal3' className='modal eventForm'><div className="modal-content">
      <EventForm
      handleCancelButtonClick = {this.handleCancelButtonClick}
      onEventSubmit = {this.handleEventSubmit}
      />

  </div></div>;
    var button = (this.state.clicked ? createEventFormDiv : createEventButton);
    return(button);
  }
});
