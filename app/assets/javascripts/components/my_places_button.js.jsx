var MyPlacesButton = React.createClass({
  getInitialState: function() {
    return {clicked: false, buttName: 'My Places'};
  },

  handleFilterAction: function() {
    this.props.onFilterAction();
  },


  handleClick: function(e) {
    e.preventDefault();
    if (this.state.clicked === false) {
      this.setState({clicked: true, buttName: 'Show All Venues'});
    } else{
      this.setState({clicked: false, buttName: 'Show My Places'})
    }
    this.handleFilterAction()
  },


  render: function() {
    return(
      <Button className='btn-flat indigo accent-3 right' onClick={this.handleClick}>{this.state.buttName}</Button>
    );
  }
});
