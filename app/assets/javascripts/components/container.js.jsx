var Container = React.createClass({
  getInitialState: function() {
    return {login_clicked: false};
  },
  handleLoginClick: function (){
    this.setState({login_clicked: true});
    this.render();
  },
  render: function (){
    return(
      <div className="matroshka">
        <NavBar onLoginButtonClick={this.handleLoginClick} />
        <Map login_clicked={this.state.login_clicked} />
      </div>
    );
  }
});


