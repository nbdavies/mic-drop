var InfoCard = React.createClass({
  render: function(){
    return (<div id="event-card-container">
      <Card className = 'large'
        header={<CardTitle image={this.props.event.photo}> this.props.event.name</CardTitle>}
        actions={[<a href='new_rsvp'> RSVP to this event</a>]}>
        this.props.event.description
        </Card>
        </div>);
  },

});
