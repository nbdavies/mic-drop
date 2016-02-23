var SiteGuide = React.createClass({

  componentDidMount: function() {
    $("#modal5").openModal();
  },

  handleCancelButtonClick: function() {
    $(".lean-overlay").hide();
  },

  render: function(){
    return(
      <div>
        <h5>Mic Drop finds cool activities in your area. Log in to RSVP for events and see which events your friends are attending.</h5>
      </div>
    )
  }
})
