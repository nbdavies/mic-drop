var InfoCard = React.createClass({
  render: function(){
    return (<div id="event-card-container">
      <Card className = 'small'
        header={<CardTitle image='#'>this.props.event.name</CardTitle>}
        actions={[<a href='new_rsvp'> RSVP to this event]}>
        this.props.event.description
        </Card>
        </div>);
  },

});


