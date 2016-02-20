var Container = React.createClass({
  getInitialState: function() {
    return {login_clicked: false}, {register_clicked: false};
  },
  handleLoginClick: function (){
    this.setState({login_clicked: true});
    this.render();
  },
    handleRegisterClick: function (){
    this.setState({register_clicked: true});
    this.render();
  },
  render: function (){
    return(
      <div className="matroshka">
        <NavBar onLoginButtonClick={this.handleLoginClick} onRegisterButtonClick={this.handleRegisterClick} />
        <MapDiv login_clicked={this.state.login_clicked} register_clicked={this.state.register_clicked} />
      </div>
    );
  }
});


