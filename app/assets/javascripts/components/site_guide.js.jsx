var SiteGuide = React.createClass({

  componentDidMount: function() {
    $("#modal5").openModal();
  },

  handleCancelButtonClick: function() {
    $("#modal5").closeModal();
    $(".lean-overlay").hide();
  },

  render: function(){
    return(
      <div className="valign">
        <h5 className="site-guide"><p>Mic Drop helps you find cool activities in your area.</p> <p>Log in to RSVP for events and connect your Facebook account to see which events your friends are attending. </p></h5>
        <div className="center"><Button className="btn-flat indigo accent-3 center" onClick={this.handleCancelButtonClick}>Find out what you're doing tonight.</Button></div>
      </div>
    );
  }
});
