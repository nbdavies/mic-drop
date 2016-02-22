var EventForm = React.createClass({
  getInitialState: function() {
    return {name: '', date: '', time: '', venue_id: ''};
  },
  handleSubmit: function(e) {
    e.preventDefault();
    var request = $.ajax({
      url: "events",
      method: "post",
      data: {event: this.state}
    });
    request.done(function(responseData){
      $("#modal1").closeModal();
      $(".lean-overlay").hide();
    }.bind(this));
  },
  componentDidMount: function() {
    $(this.refs.eventForm).find("select").show()
  },

  handleNameChange: function(e) {
    this.setState({name: e.target.value});
  },

  handleDateChange: function(e) {
    this.setState({date: e.target.value});
  },

  handleTimeChange: function(e) {
    this.setState({time: e.target.value});
  },

  handleDescriptionChange: function(e) {
    this.setState({description: e.target.value});
  },

  handleVenueChange: function(e) {
    this.setState({venue_id: e.target.value});
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
    <div col s12><form ref="eventForm" className="eventForm">
        <select defaultValue="" onChange={this.handleVenueChange} >
          <option value="" disabled>Choose your venue</option>
          {venues.map(function(venue){
            return <option value={venue.id} key={venue.id}>{venue.name}</option>;
          })}
        </select>
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
          placeholder="time"
          value={this.state.time}
          onChange={this.handleTimeChange} />
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


