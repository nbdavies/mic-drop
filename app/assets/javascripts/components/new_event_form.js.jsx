var EventForm = React.createClass({
  getInitialState: function() {
    return {name: '', date: '', start_time: '', end_time: '', venue_id: ''};
  },
  componentDidMount: function() {
    $('select').material_select();
  },

  handleSubmit: function(e) {
    e.preventDefault();
    var request = $.ajax({
      url: "/events",
      method: "post",
      data: {event: this.state}
    });
    request.done(function(responseData){
      $("#modal1").closeModal();
      $(".lean-overlay").hide();
    }.bind(this));
  },

  handleNameChange: function(e) {
    this.setState({name: e.target.value});
  },

  handleDateChange: function(e) {
    this.setState({date: e.target.value});
  },

  handleStartTimeChange: function(e) {
    this.setState({start_time: e.target.value});
  },

  handleEndTimeChange: function(e) {
    this.setState({end_time: e.target.value});
  },

  handleDescriptionChange: function(e) {
    this.setState({description: e.target.value});
  },

  handleVenueChange: function(e) {
    this.setState({venue_id: this.refs.mySelect.value});
  },

  render: function() {
    var venues;
    var request = $.ajax({
      url: "/venues",
      dataType: 'json',
      type: 'GET',
      async: false
    });
    request.done(function(responseData){
      venues = responseData;
      console.log(responseData);
    });
    return (
    <div><form className="eventForm">
        <div className="input-field">

        <select ref="mySelect"
          value={this.state.venue_id}
          onChange={this.handleVenueChange} >
        <option value="" disabled>Choose venue</option>
          {venues.map(function(venue){
            return <option value={venue.id} key={venue.id} >{venue.name}</option>;
          })}
        </select></div>

        <input
          type="text"
          placeholder="name"
          value={this.state.name}
          onChange={this.handleNameChange} />
        <input
          type="date"
          placeholder="date"
          value={this.state.date}
          className="datepicker"
          onChange={this.handleDateChange} />
        <input
          type="time"
          placeholder="start time"
          value={this.state.start_time}
          onChange={this.handleStartTimeChange} />
        <input
          type="time"
          placeholder="end time"
          value={this.state.end_time}
          onChange={this.handleEndTimeChange} />
        <textarea
          type="text"
          placeholder="description"
          value={this.state.description}
          onChange={this.handleDescriptionChange} />
        <input type="submit" value="Drop the mic!" className="btn" onClick={this.handleSubmit} />
      </form></div>
    );
  }
});


