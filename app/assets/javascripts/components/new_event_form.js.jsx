var EventForm = React.createClass({
  getInitialState: function() {
    return {name: '', date: '', time: '', venue_id: ''};
  },
  handleSubmit: function(e) {
    e.preventDefault();
    //ajax
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
    <div col s12><form className="eventForm">
        <select>
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


