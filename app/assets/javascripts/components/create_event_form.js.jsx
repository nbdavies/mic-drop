var EventForm = React.createClass({
  getInitialState: function() {
    return {name: '', date: '', start_time: '', end_time: '', venue_id: ''};
  },
  handleSubmit: function(e) {
    e.preventDefault();
    this.setState({loading: true});
    var request = $.ajax({
      url: "events",
      method: "post",
      data: {event: this.state}
    });
    request.done(function(responseData){
      this.setState({loading: false});
      $("#modal3").closeModal();
      $(".lean-overlay").remove();
      this.props.onEventSubmit(this.state);
    }.bind(this));
  },
  componentDidMount: function() {
    $(this.refs.eventForm).find("select").show();
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

  handlePhotoChange: function(e) {
    var self = this;
    var reader = new FileReader();
    var file = e.target.files[0];

    reader.onload = function(upload) {
      self.setState({
        photo: upload.target.result,
      });
    };
    reader.readAsDataURL(file);
  },

  handleTagsChange: function(e) {
    this.setState({tags: e.target.value});
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
        <div className="file-field input-field">
          <div className="btn indigo accent-3">
          <span>Upload</span>
        <input type="file"
               name="photo"
               accept="image/*"
               onChange={this.handlePhotoChange}/>
        </div>
        <div className="file-path-wrapper">
          <input className="file-path validate" type="text" placeholder="Image (optional)"/>
        </div>
        </div>
        <input
          type="text"
          placeholder="tag1,tag2"
          value={this.state.tags}
          onChange={this.handleTagsChange} />

         { this.state.loading ? (
         <Preloader className='loadingIndicator centerAlign' size='small'/>
         ) : (
        <input type="submit" value="Drop the mic!" className="btn-flat indigo accent-3" onClick={this.handleSubmit} /> )
        }
        <Button className="btn-flat indigo accent-3 right" onClick={this.props.handleCancelButtonClick}>Cancel</Button>

      </form></div>
    );
  }
});
