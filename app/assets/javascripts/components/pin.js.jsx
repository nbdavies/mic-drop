var Pin = React.createClass({
  getInitialState: function() {
    return { clicked: false };
  },

  render: function(){
    var pinClick = <div id='clickZone' onClick={this.handleClick} />
    var infoCard =  <div className='infoCard' />

    var eventStuff = (this.state.clicked ? infoCard : pinClick);
    return (
      eventStuff
      );
  }
})
